pragma solidity ^0.5.1;

import"./Contract2.sol";

contract PlayerInteraction is PlayerFactory {
    
    uint256 games_played = 0;
    
    enum SportsGames {FOOTBALL, BASKETBALL, BASEBALL, GOLF}
    enum  {SINGLES, TEAMS}
    
    struct Game {
        address player1;
        address player2;
        uint score1;
        uint score2;
        SportsGames 
        bool begun;
        bool finished;
        
    }

    
    function SelectGame() public {
        
    }
    
    function GamePlayed() public returns (bool finished) {
        games_played++;
        return true;
    }
    
    
}
