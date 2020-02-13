pragma solidity ^0.5.1;

contract TrollFactory {
    
    uint public total_trolls;
    uint public troll_types;
    address public contract_owner;
    bool public contract_active;
    
    struct Troll {
        string name;
        bytes4 type_of;
        uint id;
        uint health;
        uint lifes;
        uint strength;
        uint power;
        uint speed;
        uint agility;
        uint cleverness;
        uint troll_number;
        address owner;
        bool playable;
    }
    
    mapping (address => mapping(uint => Troll)) public troll_owner;
    
    Troll[] public trolls;
    
    constructor () public {
        total_trolls = 0;
        troll_types = 10;
        contract_owner = msg.sender;
        contract_active = true;
    }
    
    function Newtroll(string memory _name) public {
        Troll memory newTroll = Troll(_name, 0, 1, 0, 0, 0, 0, 0, 0, 0, total_trolls, msg.sender, true);
        troll_owner[msg.sender][total_trolls] = newTroll;
        trolls.push(newTroll);
    }
    
    function plus1() private {
        total_trolls = total_trolls + 1;
    }
    
}
