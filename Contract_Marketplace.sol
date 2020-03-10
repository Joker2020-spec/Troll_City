pragma solidity ^0.6.0;

import"./ERC20.sol";

contract Marketplace {
    
    uint256 public ONE_HOUR_AUCTION = 3600;
    uint256 public ONE_DAY_AUCTION = 86400;
    uint256 public ONE_WEEK_AUCTION = 604800;
    
    ERC20 erc20;
    
    function SetTokenAddress(address _contract) public {
        erc20 = ERC20(_contract);
    }
    
    uint256 public _totalSales;
    address public _owner;
    
    struct item {
        uint256 _item_id;
        uint256 _item_number;
        uint256 _price;
        uint256 _time_slot;
        uint256 _bids;
        uint256 _current_bid;
        address _top_bidder;
        address _owner;
        address _buyer;
        bool _sold;
        bool auc_finished;
    }
    
    item[] public items;
    
    modifier CheckTime(uint256 _item) {
        require (items[_item]._time_slot > now, "The time allocation against this 'item' has not ended yet.");
        _;
    }
    
    modifier CheckBid(uint256 _item, uint256 _bid) {
        require (items[_item]._price >= _bid, "The asking price is greater than the bid.");
        require (items[_item]._current_bid <= _bid, "The current bid is matched or given more value.");
        _;
    }
    
    event NewItemForSale(uint256 _item_id, uint256 _price, uint256 _time_slot);
    event SaleFinalised(address _buyer, address _seller, uint256 _item, uint256 _price);
    event NewBid(address _bidder, uint256 _item, uint256 _bid);
    
    
    
    function SellItem(uint256 _itemId, uint256 _price, uint256 _time_slot) public {
       items.push(item(_itemId, items.length, _price, now + _time_slot, 0, 0, address(0), msg.sender, address(0), false, false));
       emit NewItemForSale(items.length, _price, _time_slot);
   }
    
   function BuyItem(uint256 _item, uint256 _value) private CheckTime(_item) {
       require (items[_item]._price == _value);
       if (items[_item]._item_number == _item) {
           items[_item]._sold = true;
           items[_item]._buyer = msg.sender;
           items[_item].auc_finished = true;
       }
       erc20.Transfer(items[_item]._owner, _value);
       _totalSales++;
       emit SaleFinalised(msg.sender, items[_item]._owner, _item, _value);
   }
   
   function Bid(uint256 _item, uint256 _bid) public CheckTime(_item) CheckBid(_item, _bid) {
       if (items[_item]._item_number == _item) {
           items[_item]._bids = items[_item]._bids + 1;
           items[_item]._current_bid = _bid;
           items[_item]._top_bidder = msg.sender;
           emit NewBid(msg.sender, _item, _bid);
       }
   }
   
   function EndAuction(uint256 _item) public {
       require (msg.sender == items[_item]._owner);
       items[_item].auc_finished = true;
       items[_item]._time_slot = 0;
       items[_item]._buyer = address(0);
   }
   
   
}
