pragma solidity 0.5.1;

import"./Contract1.sol";
import"./SafeMath.sol";

contract PlayerFactory {
    
   // address TrollFactory = 0x08970FEd061E7747CD9a38d680A601510CB659FB;
    
    TrollFactory TF;
    
    function SetTrollFactory(address _key) public {
        TF = TrollFactory(_key);
    }
    
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
    
    function ChangePlayerName(string memory _newName, uint _playerNum) public returns (string memory name) {
        require (msg.sender == playerProfile[msg.sender].key);
        playerProfile[msg.sender].name = _newName;
        players[_playerNum].name = _newName;
        return players[_playerNum].name;
    }
    
    function NewTrollType1(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment1) {
            TF.Newtroll_T1(_name);
            return true;
        } else {
            revert("Payment is not valid");
        }
        
    }
    
    function NewTrollType2(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment2) {
            TF.Newtroll_T2(_name);
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType3(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment3) {
            TF.Newtroll_T3(_name);
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType4(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment4) {
            TF.Newtroll_T4(_name);
        } else {
            revert("Payment is not valid");
        }
        return true;
        
    }
    
    function NewTrollType5(string memory _name) public payable returns (bool success) {
        CheckPayment;
        if (msg.value == payment5) {
            TF.Newtroll_T5(_name);
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
    
    function GetPlayer(uint256 _player) public view returns (string memory, address, uint256, uint256, uint256, uint256, uint256, uint256, uint256, bool) {
        for (uint i = 0; i < players.length; i++) {
            if (players[i].id == _player) {
            return(players[i].name, 
                   players[i].key, 
                   players[i].id, 
                   players[i].type1, 
                   players[i].type2, 
                   players[i].type3, 
                   players[i].type4, 
                   players[i].type5, 
                   players[i].player_trolls.length, 
                   players[i].active); 
                
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
    
    function CheckPlayerActive(address p1, address p2) public view {
        require (playerProfile[p1].active == true);
        require (playerProfile[p2].active == true);
    }
    
    function DeActivatePlayer(address _key, uint256 _playerNum) public returns (bool success) {
        require (playerProfile[_key].active == true);
        playerProfile[_key].active = false;
        players[_playerNum].active = false;
        return true;
    }
    
    function ReActivatePlayer(address _key, uint256 _playerNum) public returns (bool success) {
        require (playerProfile[_key].active == false);
        playerProfile[_key].active = true;
        players[_playerNum].active = true;
        return true;
    }
    
}
