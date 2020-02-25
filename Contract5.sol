pragma solidity ^0.5.1;

contract Time {
    
    uint256 max_singles_time = 5 minutes;
    
    struct Limit {
        uint time;
        bool started;
        bool finished;
    }
    
    Limit[] public limit;
    
    function StartTime() public {
        limit.push(Limit(now, true, false));
    }
    
    function CheckTime(uint _limit) public returns (string memory) {
        if (limit[_limit].time + 5 minutes <= now) {
            limit[_limit].finished = true;
            return "Time finished";
        }
    }
}

