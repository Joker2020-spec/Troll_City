pragma solidity 0.5.1;

import"./Contract1.sol";

contract PlayerFactory is TrollFactory {
    
    uint256 private Troll_Id = 0;
    
    struct PlayerCache {
        string name;
        uint256 type1;
        uint256 type2;
        uint256 type3;
        uint256 type4;
        uint256 type5;
        mapping (uint256 => address) player_trolls;
    }
    
    PlayerCache[] public players;
    
    mapping (address => PlayerCache) public playerProfile;
    
    function NewPlayer(string memory _name) public {
        PlayerCache memory newPlayer = PlayerCache(_name, 
            playerProfile[msg.sender].type1 + Troll_Id, 
            playerProfile[msg.sender].type2 + Troll_Id, 
            playerProfile[msg.sender].type3 + Troll_Id, 
            playerProfile[msg.sender].type4 + Troll_Id, 
            playerProfile[msg.sender].type5 + Troll_Id
        );
        players.push(newPlayer);
    }
    
}   
