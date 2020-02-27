pragma solidity ^0.5.1;

import"./Contract1.sol";
import"./Contract2.sol";
import"./Contract3.sol";
import"./SafeMath.sol";

contract PlayerInteraction {
    
    TrollStatFactory TS;
    
    function SetStatFactoryAddress(address _statContract) public {
        require (msg.sender == contract_owner, "Contract address can only be set by the contract owner");
        TS = TrollStatFactory(_statContract);
    }
    
    TrollFactory TF;
    
    function SetTrollFactory(address _key) public {
       TF = TrollFactory(_key);
    }
    
    function TrollOwner(uint tid) private view {
        TS.OnlyTrollOwner(tid);
    }
    
    using SafeMath for uint256;

    uint8 max_single_player = 2;
    uint8 team_max_multiplayer = 5;
    uint256 games_open = 0;
    uint256 games_finished = 0;
    uint256 games_played = 0;
    uint256 max_singles_time = 5 minutes;
    // Input "10" - Target Score to win match. 
    address contract_owner;
    
    enum SportsGames {FOOTBALL, BASKETBALL, BASEBALL, GOLF} SportsGames SG;
    enum GameChoice {SINGLES, TEAMS} GameChoice GC;

    
    struct SinglesGame {
        uint number;
        uint score1;
        uint score2;
        uint time;
        address player1;
        address player2;
        SportsGames sg;
        GameChoice gc;
        bool begun;
        bool finished;
    }
    
    SinglesGame[] public game_on;
    
    
    event NewSinglesGame(uint gameOpened, address player1, address player2);
    event SinglesGameShut(uint gameFinished, address player1, address player2);
    
    // event ShootnSwing(address p, uint t, uint s);

    
    modifier GameActive(uint _gameNum) {
        require (game_on[_gameNum].begun == true);
        require (game_on[_gameNum].finished == false);
        _;
    }
    
    constructor () public {
        contract_owner = msg.sender;
    }
    
    
  
    function OpenSinglesGame(SportsGames _SG, GameChoice _GC, address p1, address p2) public {
        uint newGame = game_on.push(SinglesGame(game_on.length, 0, 0, now, p1, p2, _SG, _GC, true, false));
        games_open = games_open.add(newGame);
        emit NewSinglesGame(newGame, p1, p2);
    }
    
    function closeSinglesGame(address p1, address p2, uint gameNum) public {
        for (uint i = 0; i < game_on.length; i++) {
            if (game_on[gameNum].player1 == p1 && game_on[gameNum].player2 == p2) {
                game_on[i].finished = true;
                emit SinglesGameShut(game_on[i].number, p1, p2);
            }
        }
        GamePlayed();
    }
    
    function GamePlayed() private returns (bool finished) {
        games_played++;
        return true;
    }
    
    function CheckPlayerSetScore(uint gn) private {
        if (game_on[gn].player1 == msg.sender) {
            game_on[gn].score1 = game_on[gn].score1.add(1);
        } else if (game_on[gn].player2 == msg.sender) {
            game_on[gn].score1 = game_on[gn].score2.add(1); 
        }
        CheckScore(gn);
        
    }
    
    // Add function to check the game score. 
    function CheckScore(uint gn) private {
        if (game_on[gn].score1 == 10 || game_on[gn].score2 == 10) {
            game_on[gn].begun = game_on[gn].begun = false; 
            game_on[gn].finished = game_on[gn].finished = true;
        }
    }
    
    // Change - Set new score for both players and decrease the balance.
    function ShootNSwing(uint tid, uint gn) public {
        TrollOwner(tid);
        TS.DecreaseAgility(msg.sender, tid, 1);
        TS.DecreaseStrength(msg.sender, tid, 1);
        TS.DecreasePower(msg.sender, tid, 1);
        TS.DecreaseSpeed(msg.sender, tid, 1);
        TS.DecreaseHealth(msg.sender, tid, 1);
        CheckPlayerSetScore(gn);
        CheckScore(gn);
    }
    
    // Change - Set new score for both players and decrease the balance.
    function Sprint(uint tid, uint _gameNum) public GameActive(_gameNum) {
        TS.DecreaseAgility(msg.sender, tid, 2);
        TS.DecreaseHealth(msg.sender, tid, 1);
        CheckPlayerSetScore(_gameNum);
        CheckScore(_gameNum);
    }
    
    function Test(uint tid, uint _gameNum) public GameActive(_gameNum) {
        TS.IncreaseHealth(msg.sender, tid, 10);
        CheckPlayerSetScore(_gameNum);
        CheckScore(_gameNum);
    }
    
    function Test2(uint tid, uint _gameNum) public GameActive(_gameNum) {
        TS.DecreaseHealth(msg.sender, tid, 10);
        CheckPlayerSetScore(_gameNum);
        CheckScore(_gameNum);
       
    }
    
    function LifeDown(uint tid) public {
        TS.DecreaseLifes(msg.sender, tid, 1);
        // Add - Removal of troll level if lifes has been lost 10 times or more. 
    }

    
}
