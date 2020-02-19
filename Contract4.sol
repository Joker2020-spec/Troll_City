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
    
    
    function OpenGame(SportsGames _SG, GameChoice _GC, uint _gameNum) public {
        game_on[_gameNum].sg = _SG;
        game_on[_gameNum].gc = _GC;
        games_open++;
    }
    
    function GamePlayed() public returns (bool finished) {
        games_played++;
        return true;
    }
    
    function Choice(uint _SG, uint _GC) internal {
        
    }
    
    
}
