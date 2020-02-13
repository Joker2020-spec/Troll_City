pragma solidity 0.5.1;

import"./Contract1.sol";

contract PlayerFactory is TrollFactory {
    
    struct PlayerCache {
        string name;
        Troll[] type1;
        Troll[] type2;
        Troll[] type3;
        Troll[] type4;
        Troll[] type5;
    }
    
    PlayerCache[] public players;
    
    mapping (address => PlayerCache) public playerProfile;
    
    function NewPlayer(string memory _name) public {
        
        PlayerCache memory newPlayer = PlayerCache(_name, 
            playerProfile[msg.sender].type1.push(), 
            playerProfile[msg.sender].type2.push(0), 
            playerProfile[msg.sender].type3.push(0), 
            playerProfile[msg.sender].type4.push(0), 
            playerProfile[msg.sender].type5.push(0));
    }
}
