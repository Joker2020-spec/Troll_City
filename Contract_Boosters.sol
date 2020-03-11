pragma solidity ^0.6.0;

contract Boosters {
    
    uint BOOSTER_P1 = 10;
    uint BOOSTER_P2 = 20;
    uint BOOSTER_P3 = 30;
    uint BOOSTER_P4 = 40;
    uint BOOSTER_P5 = 50;
    uint BOOSTER_P6 = 60;
    uint BOOSTER_P7 = 70;
    uint BOOSTER_P8 = 80;
    uint BOOSTER_P9 = 90;
    uint BOOSTER_P10 = 100;
    uint BOOSTER_P11 = 15;
    uint BOOSTER_P12 = 28;
    uint BOOSTER_P13 = 37;
    uint BOOSTER_P14 = 41;
    uint BOOSTER_P15 = 59;
    
    uint public TOTAL_BOOSTERS = 0;
    
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
        uint BOOSTER_P11;
        uint BOOSTER_P1;
        uint BOOSTER_P10;
    }
    
    struct booster12 {
        uint BOOSTER_P12;
        uint BOOSTER_P2;
        uint BOOSTER_P9;
        uint BOOSTER_P5;
    }
    
    struct booster13 {
        uint BOOSTER_P13;
        uint BOOSTER_P3;
        uint BOOSTER_P5;
        uint BOOSTER_P4;
    }
    
    struct booster14 {
        uint BOOSTER_P14;
        uint BOOSTER_P4;
        uint BOOSTER_P10;
    }
    
    struct booster15 {
        uint BOOSTER_P15;
        uint BOOSTER_P10;
        uint BOOSTER_P9;
        uint BOOSTER_P8;
    }

    
    uint[15] private booster_t;
    uint[] public boosters;
    
    constructor () public {
        booster_t[1] = BOOSTER_P1;
        booster_t[2] = BOOSTER_P2;
        booster_t[3] = BOOSTER_P3;
        booster_t[4] = BOOSTER_P4;
        booster_t[5] = BOOSTER_P5;
        booster_t[6] = BOOSTER_P6;
        booster_t[7] = BOOSTER_P7;
        booster_t[8] = BOOSTER_P8;
        booster_t[9] = BOOSTER_P9;
        booster_t[10] = BOOSTER_P10;
        booster_t[11] = BOOSTER_P11;
        booster_t[12] = BOOSTER_P12;
        booster_t[13] = BOOSTER_P13;
        booster_t[14] = BOOSTER_P14;
        booster_t[0] = BOOSTER_P15;
    } 
    
    function NewBooster(uint _bn) public {
        boosters.push(booster_t[_bn]);
        TOTAL_BOOSTERS++;
    }
    
    function NewBoosterPack() public {
        boosters.push(booster_t[1]);
        boosters.push(booster_t[5]);
        boosters.push(booster_t[9]);
        TOTAL_BOOSTERS++;
    }
    
    
    function BoosterPack2() public {
        boosters.push(booster_t[2]);
        boosters.push(booster_t[6]);
        boosters.push(booster_t[7]);
        boosters.push(booster_t[10]);
    }
    
    function BoosterPack3() public {
        boosters.push(booster_t[3]);
        boosters.push(booster_t[4]);
        boosters.push(booster_t[8]);
        boosters.push(booster_t[13]);
        boosters.push(booster_t[2]);
    }
    
    function BoosterPack4() public {
        boosters.push(booster_t[5]);
        boosters.push(booster_t[10]);
        boosters.push(booster_t[2]);
        boosters.push(booster_t[3]);
        boosters.push(booster_t[6]);
    }
    
    function BoosterPack5() public {
        boosters.push(booster_t[14]);
        boosters.push(booster_t[2]);
        boosters.push(booster_t[0]);
        boosters.push(booster_t[8]);
        boosters.push(booster_t[6]);
    }
    
}
