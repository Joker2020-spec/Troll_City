pragma solidity ^0.5.1;

import"./Contract4.sol";

contract Time {
    
    PlayerInteraction PI;
    
    function SetInteractionAddress(address _contract) public {
        PI = PlayerInteraction(_contract);
    }
    
    uint256 max_singles_time = 5 minutes;
    
    struct Limit {
        uint time;
        bool started;
        bool finished;
    }
    
    struct Bet {
        uint bet1;
        uint bet2;
        uint payout;
        uint house;
        address winner;
    }
    
    Limit[] public limit;
    Bet[] public bets;
    
    function StartTime() public {
        limit.push(Limit(now, true, false));
    }
    
    function CheckTime(uint _limit) public returns (string memory) {
        if (limit[_limit].time + 5 minutes <= now) {
            limit[_limit].finished = true;
            return "Time finished";
        }
    }
    
    function NewBet(uint _bet1, uint _bet2) public {
        bets.push(Bet(_bet1, _bet2, 0, 0, msg.sender));
        
    }
}
