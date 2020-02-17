pragma solidity ^0.5.1;

import"./SafeMath.sol";

contract TrollFactory {
    
    using SafeMath for uint256;
    
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
    
    function Newtroll_T1(string memory _name) internal {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 1, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T2(string memory _name) internal {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 2, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T3(string memory _name) internal {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 3, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T4(string memory _name) internal {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 4, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function Newtroll_T5(string memory _name) internal {
        total_trolls = trolls.length;
        Troll memory newTroll = Troll(_name, 5, 1, 1, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    
    function getTotalTrolls() public view returns(uint256) {
        return trolls.length;
    }
    
    
    function LevelUp(address _key, uint256 _trollNumber) public {
        uint _amount = troll_owner[_key][_trollNumber].troll_level;
        for (uint256 i = 0; i < trolls.length; i++) {
            if (trolls[i].troll_number == _trollNumber) {
                trolls[i].troll_level = trolls[i].troll_level.add(_amount);
                troll_owner[_key][_trollNumber].troll_level = troll_owner[_key][_trollNumber].troll_level.add(_amount);
            }
        }
    }
    
    function IncreaseHealth(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].health = trolls[_trollNumber].health.add(_amount);
        troll_owner[_key][_trollNumber].health = troll_owner[_key][_trollNumber].health.add(_amount);
        return trolls[_trollNumber].health;
    }
    
    function IncreaseLifes(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].lifes = trolls[_trollNumber].lifes.add(_amount);
        troll_owner[_key][_trollNumber].lifes = troll_owner[_key][_trollNumber].lifes.add(_amount);
        return trolls[_trollNumber].lifes;
    }
    
    function IncreaseStrength(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].strength = trolls[_trollNumber].strength.add(_amount);
        troll_owner[_key][_trollNumber].strength = troll_owner[_key][_trollNumber].strength.add(_amount);
        return trolls[_trollNumber].strength;
    }
    
    function IncreasePower(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].power = trolls[_trollNumber].power.add(_amount);
        troll_owner[_key][_trollNumber].power = troll_owner[_key][_trollNumber].power.add(_amount);
        return trolls[_trollNumber].power;
    }
    
    function IncreaseSpeed(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].speed = trolls[_trollNumber].speed.add(_amount);
        troll_owner[_key][_trollNumber].speed = troll_owner[_key][_trollNumber].speed.add(_amount);
        return trolls[_trollNumber].speed;
    }
    
    function IncreaseAgility(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].agility = trolls[_trollNumber].agility.add(_amount);
        troll_owner[_key][_trollNumber].agility = troll_owner[_key][_trollNumber].agility.add(_amount);
        return trolls[_trollNumber].agility;
    }
    
    function IncreaseCleverness(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint) {
        trolls[_trollNumber].cleverness = trolls[_trollNumber].cleverness.add(_amount);
        troll_owner[_key][_trollNumber].cleverness = troll_owner[_key][_trollNumber].cleverness.add(_amount);
        return trolls[_trollNumber].cleverness;
    }
    
    function UpdateTrollType(address _key, uint256 _trollNumber) public returns (bool success) {
        require (trolls[_trollNumber].troll_level >= 100);
        if (trolls[_trollNumber].troll_level >= 100) {
            trolls[_trollNumber].type_of = trolls[_trollNumber].type_of.add(1);
            troll_owner[_key][_trollNumber].type_of = troll_owner[_key][_trollNumber].type_of.add(1);
        }
        return true;
    }
    
    
}    
