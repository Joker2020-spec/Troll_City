pragma solidity ^0.6.0;

contract Boosters {
    
    
    uint public BOOSTER_P1 = 10;
    uint public BOOSTER_P2 = 20;
    uint public BOOSTER_P3 = 30;
    uint public BOOSTER_P4 = 40;
    uint public BOOSTER_P5 = 50;
    uint public BOOSTER_P6 = 60;
    uint public BOOSTER_P7 = 70;
    uint public BOOSTER_P8 = 80;
    uint public BOOSTER_P9 = 90;
    uint public BOOSTER_P10 = 100;
    
    
    struct booster1 {
        uint BOOSTER_P1;
    }
    
    struct bootser2 {
        uint BOOSTER_P2;
    }
    
    struct booster3 {
        uint BOOSTER_P3;
    }
    
    struct booster4 {
        uint BOOSTER_P4;
    }
    
    struct booster5 {
        uint BOOSTER_P5;
    }
    
    struct booster6 {
        uint BOOSTER_P6;
    }
    
    struct booster7 {
        uint BOOSTER_P7;
    }
    
    struct booster8 {
        uint BOOSTER_P8;
    }
    
    struct booster9 {
        uint BOOSTER_P9;
    }
    
    struct booster10 {
        uint BOOSTER_P10;
    }
    
    struct booster11 {
        uint BOOSTER_P1;
        uint BOOSTER_P10;
    }
    
    struct booster12 {
        uint BOOSTER_P2;
        uint BOOSTER_P9;
        uint BOOSTER_P5;
    }
    
    struct booster13 {
        uint BOOSTER_P3;
        uint BOOSTER_P5;
        uint BOOSTER_P4;
    }
    
    struct booster14 {
        uint BOOSTER_P4;
        uint BOOSTER_P10;
    }
    
    struct booster15 {
        uint BOOSTER_P10;
        uint BOOSTER_P9;
        uint BOOSTER_P8;
    }
    
    uint[15] public booster_t;
    uint[] public boosters;
    
    constructor () public {
        booster_t[0] = 0;
        booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
         booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
        booster_t[1] = BOOSTER_P1;
        
    } 
    
    function NewBooster() public {
        
    }
    
    
    
}
