pragma solidity 0.5.1;

import"./Contract1.sol";
import"./SafeMath.sol";

contract PlayerFactory is TrollFactory {
    
    using SafeMath for uint256;
    
    uint256 private payment1 = 0.1 ether;
    uint256 private payment2 = 0.25 ether;
    uint256 private payment3 = 0.5 ether;
    uint256 private payment4 = 0.75 ether;
    uint256 private payment5 = 1 ether;
    
    struct PlayerCache {
        string name;
        address key;
        uint256 type1;
        uint256 type2;
        uint256 type3;
        uint256 type4;
        uint256 type5;
        uint256[] player_trolls;
    }
    
    PlayerCache[] public players;
    
    mapping (address => PlayerCache) public playerProfile;
    
    function NewPlayer(string memory _name) public {
        uint256[] memory list;
        PlayerCache memory newPlayer = PlayerCache({name: _name, key: msg.sender, type1: 0, type2: 0, type3: 0, type4: 0, type5: 0, player_trolls: list});
        playerProfile[msg.sender] = newPlayer;
        players.push(newPlayer);
    }
    
    function NewTrollType1(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment1) {
            Newtroll_T1(_name);
            UpdateTypeOne();
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function UpdateTypeOne() private {
        for (uint i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type1 = playerProfile[msg.sender].type1.add(1);
                    players[i].type1 = players[i].type1.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function GetPlayerTrolls(uint _player) public view returns (uint[] memory) {
        for (uint i = 0; i < players.length; i++) {
            return players[_player].player_trolls;
        }
    }  
    
    function CheckPayment() private {
        require (msg.value >= payment1);    
        require (msg.value >= payment2);
        require (msg.value >= payment3);
        require (msg.value >= payment4);
        require (msg.value >= payment5);
    }
    
}   
