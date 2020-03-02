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
        uint _price;
        uint _time_slot;
        address _owner;
        bool _sold;
    }
    
    item[] public items;
    
    event NewItemForSale(uint _item_id, uint _price, uint _time_slot);
    event SaleFinalised(address _buyer, address _seller, uint _item, uint _price);
    
   function Buy(address _seller, uint _item, uint _price) public {
       erc20.Transfer(_seller, _price);
       _totalSales++;
       emit SaleFinalised(msg.sender, _seller, _item, _price);
   }
   
   function Sell(uint _price, uint _time_slot) public {
       items.push(item(items.length, _price, _time_slot, msg.sender, false));
       emit NewItemForSale(items.length, _price, _time_slot);
   }
}
