pragma solidity ^0.6.0;

import"./ERC20.sol";

contract Marketplace {
    
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
        address _owner;
        bool _sold;
    }
    
    item[] public items;
    
    modifier CheckTime(uint _item) {
        require (items[_item]._time_slot > now, "The time allocation against this 'item' has not ended yet.");
        _;
    }
    
    event NewItemForSale(uint _item_id, uint _price, uint _time_slot);
    event SaleFinalised(address _buyer, address _seller, uint _item, uint _price);
    event NewBid(address _bidder, uint _item, uint _bid);
    
    
    
    function SellItem(uint _itemId, uint _price, uint _time_slot) public {
       items.push(item(_itemId, items.length, _price, now + _time_slot, 0, 0, msg.sender, false));
       emit NewItemForSale(items.length, _price, _time_slot);
   }
    
   function BuyItem(address _seller, uint _item, uint _price) public {
       if (items[_item]._item_number == _item) {
           items[_item]._sold = true;
       }
       erc20.Transfer(_seller, _price);
       _totalSales++;
       emit SaleFinalised(msg.sender, _seller, _item, _price);
   }
   
   function Bid(uint _item, uint _bid) public CheckTime(_item) {
       if (items[_item]._item_number == _item) {
           items[_item]._bids = items[_item]._bids + 1;
           items[_item]._current_bid = _bid;
           emit NewBid(msg.sender, _item, _bid);
       }
   }
   
   
}
