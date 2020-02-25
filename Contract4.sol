pragma solidity ^0.5.1;

import"./Contract1.sol";
import"./Contract2.sol";
import"./Contract3.sol";
import"./SafeMath.sol";

contract PlayerInteraction is TrollFactory {
    
    PlayerFactory PF;
    TrollStatFactory TS;
    
    function SetPlayerAddress(address _playerContract) public {
        require (msg.sender == contract_owner, "Contract address can only be set by the contract owner");
        PF = PlayerFactory(_playerContract);
    }
    
    function SetStatFactoryAddress(address _statContract) public {
        require (msg.sender == contract_owner, "Contract address can only be set by the contract owner");
        TS = TrollStatFactory(_statContract);
    }
    
    using SafeMath for uint256;

    uint8 max_single_player = 2;
    uint8 team_max_multiplayer = 5;
    uint256 games_open = 0;
    uint256 games_finished = 0;
    uint256 games_played = 0;
    uint256 max_singles_time = 5 minutes;
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
    
    modifier TrollsPlayableSingles(uint t1, uint t2) {
        require (trolls[t1].playable == true && trolls[t2].playable == true);
        _;
    }
    
    modifier TrollsPlayableMulti(uint t1, uint t2, uint t3, uint t4, uint t5, uint t6, uint t7, uint t8, uint t9, uint t10) {
        require (trolls[t1].playable == true && trolls[t2].playable == true && trolls[t3].playable == true && trolls[t4].playable == true && trolls[t5].playable == true);
        require (trolls[t6].playable == true && trolls[t7].playable == true && trolls[t8].playable == true && trolls[t9].playable == true && trolls[t10].playable == true);
        _;
    }
    
    modifier PlayersActive(address p1, address p2) {
        PF.CheckPlayerActive(p1, p2);
        _;
    } 
    
    modifier GameActive(uint _gameNum) {
        require (game_on[_gameNum].begun == true);
        require (game_on[_gameNum].finished == false);
        _;
    }
    
    constructor () public {
        contract_owner = msg.sender;
    }
    
    
    // Change - 0, 0 to 100, 100 for each score and the decrease every move for each player. 
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
    
    // Change - Set new score for both players and decrease the balance.
    function ShootNSwing(uint tid) public {
        require (msg.sender == trolls[tid].owner);
        TS.DecreaseAgility(msg.sender, trolls[tid].troll_number, 1);
        TS.DecreaseStrength(msg.sender, trolls[tid].troll_number, 1);
        TS.DecreasePower(msg.sender, trolls[tid].troll_number, 1);
        TS.DecreaseSpeed(msg.sender, trolls[tid].troll_number, 1);
    }
    
    // Change - Set new score for both players and decrease the balance.
    function Attack(address p1, uint tid1, uint _gameNum) public GameActive(_gameNum) {
        assert (msg.sender != p1);
        TS.DecreaseStrength(p1, tid1, 2);
        TS.DecreasePower(p1, tid1, 2);
        TS.DecreaseSpeed(p1, tid1, 2);
        TS.DecreaseHealth(p1, tid1, 6);
    }
    
    // Change - Set new score for both players and decrease the balance.
    function Sprint(uint tid, uint _gameNum) public GameActive(_gameNum) {
        TS.DecreaseAgility(msg.sender, tid, 2);
        TS.DecreaseCleverness(msg.sender, tid, 2);
    }
    
    
    function LevelDown(uint tid) public {
        TS.DecreaseLifes(msg.sender, tid, 1);
    }

    
}
