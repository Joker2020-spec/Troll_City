pragma solidity ^0.5.1;

import"./Contract2.sol";

contract PlayerInteraction is PlayerFactory {
    
    uint256 games_open = 0;
    uint256 games_finished = 0;
    uint256 games_played = 0;
    
    enum SportsGames {FOOTBALL, BASKETBALL, BASEBALL, GOLF} SportsGames SG;
    enum GameChoice {SINGLES, TEAMS} GameChoice GC;

    
    struct Game {
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
    
    Game[] public game_on;
    
    event NewSinglesGame(uint gameOpened, address player1, address player2);
    event SinglesGameShut(uint gameFinished, address player1, address player2);
    
    function OpenSinglesGame(SportsGames _SG, GameChoice _GC, address p1, address p2) public {
        uint newGame = game_on.push(Game(game_on.length, 0, 0, p1, p2, _SG, _GC, true, false));
        games_open = games_open.add(newGame);
        emit NewSinglesGame(newGame, p1, p2);
    }
    
    function closeSinglesGame(address p1, address p2, uint gameNum) public {
        for (uint i = 0; i < game_on.length; i++) {
            if (game_on[i].player1 == p1 && game_on[i].player2 == p2) {
                game_on[i].finished = true;
                emit SinglesGameShut(game_on[i], p1, p2);
            }
        }
        
    }
    
    function GamePlayed() public returns (bool finished) {
        games_played++;
        return true;
    }

    
}
