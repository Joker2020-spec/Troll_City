pragma solidity ^0.5.1;

import"./SafeMath.sol";

contract TrollFactory {
    
    using SafeMath for uint256;
    
    uint256 internal total_trolls;
    
    uint32 public troll_types;
    uint32 public max_troll_level = 50;
    address public contract_owner;
    bool public contract_active;
    
    
    struct Troll {
        string name;
        uint256 type_of;
        uint256 troll_level;
        uint256 health;
        uint256 lifes;
        uint256 times_lost;
        uint256 strength;
        uint256 power;
        uint256 speed;
        uint256 agility;
        uint256 troll_number;
        address owner;
        bool playable;
    }
    
    mapping (address => mapping(uint256 => Troll)) public troll_owner;
    
    Troll[] public trolls;
    
    modifier OnlyOwner () {
        require (msg.sender == contract_owner);
        _;
    }
    
    constructor () public {
        total_trolls = 0;
        troll_types = 5;
        contract_owner = msg.sender;
        contract_active = true;
    }
    
    function Newtroll_T1(string memory _name) internal {
        total_trolls.add(1);
        Troll memory newTroll = Troll(_name, 1, 1, 100, 10, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T2(string memory _name) internal {
        total_trolls.add(1);
        Troll memory newTroll = Troll(_name, 1, 2, 100, 20, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T3(string memory _name) internal {
        total_trolls.add(1);
        Troll memory newTroll = Troll(_name, 1, 3, 100, 30, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T4(string memory _name) internal {
        total_trolls.add(1);
        Troll memory newTroll = Troll(_name, 1, 4, 100, 40, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T5(string memory _name) internal {
        total_trolls.add(1);
        Troll memory newTroll = Troll(_name, 1, 5, 100, 5, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    
    function getTotalTrolls() public view returns(uint256) {
        return trolls.length;
    }

    
    function NewTrollOwner(address _old, address _new, uint256 _trollNumber) public returns (address) {
        require (trolls[_trollNumber].owner == _old);
        trolls[_trollNumber].owner = _new;
        troll_owner[_old][_trollNumber].owner = _new;
        troll_owner[_new][_trollNumber].owner = _new;
        return trolls[_trollNumber].owner;
    }
    
    function ChangeTrollName(uint256 _trollNumber, string memory _newName) public {
        trolls[_trollNumber].name = _newName;
        troll_owner[msg.sender][_trollNumber].name = _newName;
    }
    
    
}    
