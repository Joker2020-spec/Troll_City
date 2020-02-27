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
    address public wallet;
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
    
    function SetWalletAddress(address key) public {
        wallet = key;
    }
    
    function BuyHealth(uint price, uint _troll) public {
        require (price >= 1);
        uint256 hp = price.div(10).mul(20);
        daitoken.transfer(wallet, price);
        TS.IncreaseHealth(msg.sender, _troll, hp);
    }
}

contract DaiFaucet is StatMarketPlace  {
    
    DaiToken daitoken;
    
	event Withdrawal(address indexed to, uint amount);
	event Deposit(address indexed from, uint amount);
	

	// Give out Dai to anyone who asks
	function withdraw(uint withdraw_amount) public {
		// Limit withdrawal amount
		require(withdraw_amount <= 0.1 ether);
		require(daitoken.balanceOf(address(this)) >= withdraw_amount,
			"Insufficient balance in faucet for withdrawal request");
		// Send the amount to the address that requested it
		daitoken.transfer(msg.sender, withdraw_amount);
		emit Withdrawal(msg.sender, withdraw_amount);
	}
	
	// Accept any incoming amount
	function () external payable {
		emit Deposit(msg.sender, msg.value);
	}
}
    
    
