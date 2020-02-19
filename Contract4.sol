pragma solidity ^0.5.1;

import"./Contract2.sol";

contract PlayerInteraction is PlayerFactory {
    
    uint256 games_open = 0;
    uint256 games_finished = 0;
    uint256 games_played = 0;
    
    enum SportsGames {FOOTBALL, BASKETBALL, BASEBALL, GOLF} SportsGames SG;
    enum GameChoice {SINGLES, TEAMS} GameChoice GC;

    
    struct Game {
        address player1;
        address player2;
        uint score1;
        uint score2;
        SportsGames sg;
        GameChoice gc;
        bool begun;
        bool finished;
    }
    
    Game[] public game_on;
    
    
    function OpenSinglesGame(SportsGames _SG, GameChoice _GC, address p1, address p2) public {
        uint newGame = game_on.push(Game(p1, p2, 0, 0, _SG, _GC, true, false));
        games_open = games_open.add(newGame);
    }
    
    function closeSinglesGame(address p1, address p2) public {
        for (uint i = 0; i < game_on.length; i++) {
            if (game_on[i].player1 == p1 && game_on[i].player2 == p2) {
                game_on[i].finished = true;
            }
        }
    }
    
    function GamePlayed() public returns (bool finished) {
        games_played++;
        return true;
    }

    
}
