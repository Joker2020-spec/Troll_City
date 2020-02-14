pragma solidity 0.5.1;

import"./Contract1.sol";

contract PlayerFactory is TrollFactory {
    
    uint private Troll_Id = 0;
    
    struct PlayerCache {
        string name;
        uint type1;
        uint type2;
        uint type3;
        uint type4;
        uint type5;
        mapping (uint => address) player_trolls;
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
    
    function NewTroll(uint _trollId) public returns (bool success) {
        uint captured = trolls.length; 
        for (uint i = 0; i < trolls.length; i++) {
            if (trolls.length[i] == troll_owner[msg.sender][_trollId].troll_number) {
                
            }
        }
    }
}
