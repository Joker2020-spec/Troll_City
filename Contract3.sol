pragma solidity 0.5.1; 

import"./Contract2.sol";

contract PlayerInteraction {
    
     function ChangePlayerName(string memory _newName, uint _playerNum) public returns (string memory name) {
        require (msg.sender == playerProfile[msg.sender].key);
        playerProfile[msg.sender].name = _newName;
        players[_playerNum].name = _newName;
        return players[_playerNum].name;
    }
    
}
