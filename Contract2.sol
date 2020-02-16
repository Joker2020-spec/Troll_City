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
        mapping (address => uint256) player_trolls;
    }
    
    PlayerCache[] public players;
    
    mapping (address => PlayerCache) public playerProfile;
    
    function NewPlayer(string memory _name) public {
        PlayerCache memory newPlayer = PlayerCache({name: _name, key: msg.sender, type1: 0, type2: 0, type3: 0, type4: 0, type5: 0});
        playerProfile[msg.sender] = newPlayer;
        players.push(newPlayer);
    }
    
    function NewTroll(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment1) {
            Newtroll_T1(_name);
            playerProfile[msg.sender].type1.add(1);
        } else if (msg.value == payment2) {
            Newtroll_T2(_name);
            playerProfile[msg.sender].type2.add(1);
        } else if (msg.value == payment3) {
            Newtroll_T3(_name);
            playerProfile[msg.sender].type3.add(1);
        } else if (msg.value == payment4) {
            Newtroll_T4(_name);
            playerProfile[msg.sender].type4.add(1);
        } else if (msg.value == payment5) {
            Newtroll_T5(_name);
            playerProfile[msg.sender].type5.add(1);
        }
        return success;
        
    }
    
    function CheckPayment() private {
        require (msg.value >= payment1);    
        require (msg.value >= payment2);
        require (msg.value >= payment3);
        require (msg.value >= payment4);
        require (msg.value >= payment5);
    }
    
}   
