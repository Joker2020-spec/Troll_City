pragma solidity ^0.6.0;

interface IERC20 {
    function TotalSupply() external view returns (uint);
    function GetBalance(address _holder) external view returns (uint);
    function Transfer(address _too, uint _amount) external;
    function IncreaseAllowance(address _spender, uint _amount) external;
    function DecreaseAllowance(address _spender, uint _amount) external;
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
   
    address public _contractOwner;
    uint public _decimals;
    uint public _totalSupply;
    string public _name;
    string public _ticker;
    
    mapping (address => uint) public _balances;
    mapping (address => mapping(address => uint)) public allowances;
    
    event transfer(address _too, uint amount);
    event approval(address _from, address _spender, uint _amount);
    
    modifier OnlyOwner() {
        require (msg.sender == _contractOwner);
        _;
    }
    
    constructor () public {
        _contractOwner = msg.sender;
        _decimals = 18;
        _totalSupply = 100 * (10 ** _decimals);
        _name = "ConWiseToken";
        _ticker = "CWT";
        _balances[_contractOwner] = _balances[_contractOwner].add(_totalSupply);
    }
    
    function TotalSupply() public override view returns (uint) {
        return _totalSupply;
    }
    
    function GetBalance(address _holder) public override view returns (uint) {
        return _balances[_holder];
    }
    
    function Transfer(address _too, uint _amount) public override {
        _Transfer(_too, _amount);
    }
    
    function _Transfer(address _too, uint _amount) private {
        require (_balances[msg.sender] >= _amount, "The sender has enough tokens to execute the transaction.");
        require (_too != address(0), "The receiver is not the 0x0000000000000000000000000000000000000000 address.");
        _balances[msg.sender] = _balances[msg.sender].sub(_amount);
        _balances[_too] = _balances[_too].add(_amount);
        emit transfer(_too, _amount);
    }
    
    function Allowance(address _owner, address _spender) public override view returns (uint) {
        return allowances[_owner][_spender];
    }
    
    function IncreaseAllowance(address _spender, uint _amount) public override {
        require (_balances[msg.sender] >= _amount, "The account having tokens deducted has a enough to approve.");
        require (_spender != address(0), "The account being approved is not the 0x0000000000000000000000000000000000000000 address");
        allowances[msg.sender][_spender] = allowances[msg.sender][_spender].add(_amount);
        emit approval(msg.sender, _spender, _amount);
    }
    
    function DecreaseAllowance(address _spender, uint _amount) public override {
        allowances[msg.sender][_spender] = allowances[msg.sender][_spender].sub(_amount);
    }
    
    function TransferFrom(address _from, address _too, uint _amount) public override {
        require (allowances[_from][msg.sender] >= _amount, "The account withdrawing the tokens is allowed to take the amount of tokens.");
        require (_balances[_from] >= _amount, "The account having tokens deducted has a balance large enough to execute the transaction.");
        require (_from != address(0), "The account having tokens deducted is not the 0x0000000000000000000000000000000000000000 address");
        require (_too != address(0), "The account being sent tokens is not the 0x0000000000000000000000000000000000000000 address");
        allowances[_from][msg.sender] = allowances[_from][msg.sender].sub(_amount);
        _balances[_from] = _balances[_from].sub(_amount);
        _balances[_too] = _balances[_too].add(_amount);
        emit transfer(_too, _amount);
    }
    
    function _Mint(address _too, uint _amount) public returns (bool) {
        require (_amount > 0, "Amount being minted is greater than 0.");
        require (_too != address(0), "The account being sent tokens is not the 0x0000000000000000000000000000000000000000 address");
        _beforeTokenTransfer(address(0), _too, _amount);
        _totalSupply = _totalSupply.add(_amount);
        _balances[_too] = _balances[_too].add(_amount);
        emit transfer(_too, _amount);
        return true;
    }
    
    function _Burn(address _from, uint _amount) public returns (bool) {
        require (_amount > 0, "Amount being minted is greater than 0.");
        require (_from != address(0), "The account being sent tokens is not the 0x0000000000000000000000000000000000000000 address");
        _beforeTokenTransfer(address(0), _from, _amount);
        _totalSupply = _totalSupply.sub(_amount);
        _balances[_from] = _balances[_from].sub(_amount);
        return true;
    }
    
    function _beforeTokenTransfer(address _from, address _too, uint256 _amount) internal virtual { }
    
}
