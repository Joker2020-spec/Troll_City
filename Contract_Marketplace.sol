pragma solidity ^0.6.0;

import"./ERC20.sol";

contract Marketplace {
    
    uint public ONE_HOUR_AUCTION = 3600;
    uint public ONE_DAY_AUCTION = 86400;
    uint public ONE_WEEK_AUCTION = 604800;
    
    ERC20 erc20;
    
    function SetTokenAddress(address _contract) public {
        erc20 = ERC20(_contract);
    }
    
    uint public _totalSales;
    address public _owner;
    
    struct item {
        uint _item_id;
        uint _item_number;
        uint _price;
        uint _time_slot;
        uint _bids;
        uint _current_bid;
        address _top_bidder;
        address _owner;
        address _buyer;
        bool _sold;
    }
    
    item[] public items;
    
    modifier CheckTime(uint _item) {
        require (items[_item]._time_slot > now, "The time allocation against this 'item' has not ended yet.");
        _;
    }
    
    modifier CheckBid(uint _item, uint _bid) {
        require (items[_item]._price > _bid, "The asking price is greater than the bid.");
        require (items[_item]._current_bid <= _bid, "The current bid is matched or given more value.");
        _;
    }
    
    event NewItemForSale(uint _item_id, uint _price, uint _time_slot);
    event SaleFinalised(address _buyer, address _seller, uint _item, uint _price);
    event NewBid(address _bidder, uint _item, uint _bid);
    
    
    
    function SellItem(uint _itemId, uint _price, uint _time_slot) public {
       items.push(item(_itemId, items.length, _price, now + _time_slot, 0, 0, address(0), msg.sender, address(0), false));
       emit NewItemForSale(items.length, _price, _time_slot);
   }
    
   function BuyItem(address _seller, uint _item, uint _value) public CheckTime(_item) {
       require (items[_item]._price == _value);
       if (items[_item]._item_number == _item) {
           items[_item]._sold = true;
           items[_item]._buyer = msg.sender;
       }
       erc20.Transfer(_seller, _value);
       _totalSales++;
       emit SaleFinalised(msg.sender, _seller, _item, _value);
   }
   
   function Bid(uint _item, uint _bid) public CheckTime(_item) CheckBid(_item, _bid) {
       if (items[_item]._item_number == _item) {
           items[_item]._bids = items[_item]._bids + 1;
           items[_item]._current_bid = _bid;
           items[_item]._top_bidder = msg.sender;
           emit NewBid(msg.sender, _item, _bid);
       }
   }
   
   
}
