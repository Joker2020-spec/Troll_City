pragma solidity ^0.5.1;

contract TrollFactory {
    
    uint internal total_trolls;
    
    uint256 public troll_types;
    uint256 public max_troll_level = 50;
    address public contract_owner;
    bool public contract_active;
    
    struct Troll {
        string name;
        uint256 type_of;
        uint256 troll_level;
        uint256 health;
        uint256 lifes;
        uint256 strength;
        uint256 power;
        uint256 speed;
        uint256 agility;
        uint256 cleverness;
        uint256 troll_number;
        address owner;
        bool playable;
    }
    
    mapping (address => mapping(uint256 => Troll)) public troll_owner;
    
    Troll[] public trolls;
    
    constructor () public {
        total_trolls = 0;
        troll_types = 5;
        contract_owner = msg.sender;
        contract_active = true;
    }
    
    function Newtroll_T1(string memory _name) public {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 0, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T2(string memory _name) public {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 0, 2, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T3(string memory _name) public {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 0, 3, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T4(string memory _name) public {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 0, 4, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T5(string memory _name) public {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 0, 5, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    
    function getTotalTrolls() public view returns(uint256) {
        return trolls.length;
    }
    
    
    function LevelUp(uint256 _trollNumber, address _key) public {
        troll_owner[_key][_trollNumber].troll_level++ ;
    }
    
}    
