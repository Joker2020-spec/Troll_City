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
        uint256 id;
        uint256 type1;
        uint256 type2;
        uint256 type3;
        uint256 type4;
        uint256 type5;
        uint256[] player_trolls;
        bool active;
    }
    
    PlayerCache[] public players;
    
    mapping (address => PlayerCache) public playerProfile;
    
    function NewPlayer(string memory _name) public {
        uint256[] memory list;
        PlayerCache memory newPlayer = PlayerCache({name: _name, key: msg.sender, id: players.length, type1: 0, type2: 0, type3: 0, type4: 0, type5: 0, player_trolls: list, active: true});
        playerProfile[msg.sender] = newPlayer;
        players.push(newPlayer);
    }
    
    function NewTrollType1(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment1) {
            Newtroll_T1(_name);
            UpdateTypeOne();
            return true;
        } else {
            revert("Payment is not valid");
        }
        
    }
    
    function NewTrollType2(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment2) {
            Newtroll_T2(_name);
            UpdateTypeTwo();
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType3(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment3) {
            Newtroll_T3(_name);
            UpdateTypeThree();
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType4(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment4) {
            Newtroll_T4(_name);
            UpdateTypeFour();
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType5(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment5) {
            Newtroll_T5(_name);
            UpdateTypeFive();
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function GetPlayerTrolls(uint _player) public view returns (uint[] memory) {
        for (uint256 i = 0; i < players.length; i++) {
            return players[_player].player_trolls;
        }
    }  
    
    function UpdateTypeOne() private {
        for (uint256 i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type1 = playerProfile[msg.sender].type1.add(1);
                    players[i].type1 = players[i].type1.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function UpdateTypeTwo() private {
        for (uint256 i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type2 = playerProfile[msg.sender].type2.add(1);
                    players[i].type2 = players[i].type2.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function UpdateTypeThree() private {
        for (uint256 i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type3 = playerProfile[msg.sender].type3.add(1);
                    players[i].type3 = players[i].type3.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function UpdateTypeFour() private {
        for (uint256 i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type4 = playerProfile[msg.sender].type4.add(1);
                    players[i].type4 = players[i].type4.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function UpdateTypeFive() private {
        for (uint256 i = 0; i < players.length; i++) {
                if (players[i].key == msg.sender) {
                    playerProfile[msg.sender].type5 = playerProfile[msg.sender].type5.add(1);
                    players[i].type5 = players[i].type5.add(1);
                    players[i].player_trolls.push(trolls.length);
                }
            }
    }
    
    function CheckPayment() private {
        require (msg.value >= payment1);    
        require (msg.value >= payment2);
        require (msg.value >= payment3);
        require (msg.value >= payment4);
        require (msg.value >= payment5);
    }
    
    function DeActivatePlayer(address _key, uint256 _playerNum) public returns (bool success) {
        require(playerProfile[_key].active == true);
        playerProfile[_key].active = false;
        players[_playerNum].active = false;
        return true;
    }
    
    function ReActivatePlayer(address _key, uint256 _playerNum) public returns (bool success) {
        require(playerProfile[_key].active == false);
        playerProfile[_key].active = true;
        players[_playerNum].active = true;
        return true;
    }
    
}
