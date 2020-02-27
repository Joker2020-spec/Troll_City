pragma solidity ^0.5.0;

import"./Contract3.sol";
import"./SafeMath.sol";

interface DaiToken {
    function transfer(address dst, uint wad) external returns (bool);
    function balanceOf(address guy) external view returns (uint);
}

contract StatMarketPlace {
    
    using SafeMath for uint256;
    
    DaiToken daitoken;
    TrollStatFactory TS;
    
    address public owner;
    uint public total_buys;
    uint public total_sells; 
    
    function SetDaiTokenAddress(address key) public {
        require (msg.sender == owner);
        daitoken = DaiToken(key);
    }
    
    function SetTrollStatFactoryAddress(address key) public {
        require (msg.sender == owner);
        TS = TrollStatFactory(key);
    }
    
    function BuyHealth(uint price, uint _troll) public {
        uint256 hp = price.div(10).mul(20);
        TS.IncreaseHealth(msg.sender, _troll, hp);
    }
    
    
    
}
