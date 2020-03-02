pragma solidity ^0.6.0;

import"./ERC20.sol";

contract Marketplace {
    
    ERC20 erc20;
    
    function SetTokenAddress(address _contract) public {
        erc20 = ERC20(_contract);
    }
    
    uint public _totalSales;
    address public _owner;
    
    event SaleFinalised(address _buyer, address _seller, uint _item, uint _price);
    
   function Buy(address _seller, uint _item, uint _price) public {
       erc20.Transfer(_seller, _price);
       _totalSales++;
       emit SaleFinalised(msg.sender, _seller, _item, _price);
   }
}
