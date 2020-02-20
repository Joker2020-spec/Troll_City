pragma solidity ^0.5.1;

import"./Contract1.sol";
// import"./Contract2.sol";
import"./SafeMath.sol";

contract PlayerInteraction is TrollFactory {
    
    PlayerFactory PF;
    
    function SetPlayerAddress(address _playerContract) public {
        require (msg.sender == contract_owner, "Contract address can only be set by the contract owner");
        PF = PlayerFactory(_playerContract);
    }
    
    using SafeMath for uint256;

    uint8 max_single_player = 2;
    uint8 team_max_multiplayer = 5;
    uint256 games_open = 0;
    uint256 games_finished = 0;
    uint256 games_played = 0;
    address contract_owner;
    
    enum SportsGames {FOOTBALL, BASKETBALL, BASEBALL, GOLF} SportsGames SG;
    enum GameChoice {SINGLES, TEAMS} GameChoice GC;

    
    struct SinglesGame {
        uint number;
        uint score1;
        uint score2;
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
    
    constructor () public {
        contract_owner = msg.sender;
    }
    
    function OpenSinglesGame(SportsGames _SG, GameChoice _GC, address p1, address p2) public {
        uint newGame = game_on.push(SinglesGame(game_on.length, 0, 0, p1, p2, _SG, _GC, true, false));
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

    
}
