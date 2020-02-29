pragma solidity ^0.6.0;

interface IERC20 {
    function TotalSupply() external view returns (uint);
    function GetBalance(address _holder) external view returns (uint);
    function Transfer(address _too, uint _amount) external;
    function Approve(address _spender, uint _amount) external;
    function TransferFrom(address _from, address _spender, uint _amount) external;
    function Allowance(address _owner, address _spender) external view returns (uint);
    event transfer(address _too, uint _amount);
    event approval(address _from, address _spender, uint _amount);
}

library SafeMath {
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    
     function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    
     function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
    
     function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    
     function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
    
}

contract ERC20 is IERC20 {
    
    using SafeMath for uint256;
    
    uint public _totalSupply;
    uint public _decimals;
    address public _contractOwner;
    string public _name;
    string public _ticker;
    
    mapping (address => uint) public _balances;
    mapping (address => mapping(address => uint)) public allowances;
    
    event transfer(address _too, uint amount);
    event approval(address _from, address _spender, uint _amount);
    
    constructor () public {
        
    }
    
    function TotalSupply() public override view returns (uint) {
        return _totalSupply;
    }
    
    function GetBalance(address _holder) public override view returns (uint) {
        return _balances[_holder];
    }
    
    function Transfer(address _too, uint _amount) public override {
        
    }
    
    function Allowance(address _owner, address _spender) public override view returns (uint) {
        return allowances[_owner][_spender];
    }
    
    function Approve(address _spender, uint _amount) public override {
        
    }
    
    function TransferFrom(address _from, address _too, uint _amount) public override {
        
    }
    
}
