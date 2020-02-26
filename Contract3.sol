pragma solidity ^0.5.1;

import"./Contract2.sol";


contract TrollStatFactory is PlayerFactory {
    
    
    // "Increase Stat Functions". /////////////////////////////////////////////////////////////////////////
    function IncreaseHealth(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].health = trolls[_trollNumber].health.add(_amount);
        troll_owner[_key][_trollNumber].health = troll_owner[_key][_trollNumber].health.add(_amount);
        return trolls[_trollNumber].health;
    }
    
    function IncreaseLifes(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].lifes = trolls[_trollNumber].lifes.add(_amount);
        troll_owner[_key][_trollNumber].lifes = troll_owner[_key][_trollNumber].lifes.add(_amount);
        return trolls[_trollNumber].lifes;
    }
    
    function IncreaseStrength(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].strength = trolls[_trollNumber].strength.add(_amount);
        troll_owner[_key][_trollNumber].strength = troll_owner[_key][_trollNumber].strength.add(_amount);
        return trolls[_trollNumber].strength;
    }
    
    function IncreasePower(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].power = trolls[_trollNumber].power.add(_amount);
        troll_owner[_key][_trollNumber].power = troll_owner[_key][_trollNumber].power.add(_amount);
        return trolls[_trollNumber].power;
    }
    
    function IncreaseSpeed(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].speed = trolls[_trollNumber].speed.add(_amount);
        troll_owner[_key][_trollNumber].speed = troll_owner[_key][_trollNumber].speed.add(_amount);
        return trolls[_trollNumber].speed;
    }
    
    function IncreaseAgility(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].agility = trolls[_trollNumber].agility.add(_amount);
        troll_owner[_key][_trollNumber].agility = troll_owner[_key][_trollNumber].agility.add(_amount);
        return trolls[_trollNumber].agility;
    }
    
    // Not Working!
    function LevelUp(address _key, uint256 _trollNumber) public {
        for (uint128 i = 0; i < trolls.length; i++) {
            if (trolls[i].troll_number == _trollNumber) {
                trolls[i].troll_level = trolls[i].troll_level.add(1);
                troll_owner[_key][_trollNumber].troll_level = troll_owner[_key][_trollNumber].troll_level.add(1);
                troll_owner[_key][_trollNumber].lifes = troll_owner[_key][_trollNumber].lifes.add(1);
            }
        }
     }
    
    // "Decrease Stat Functions". //////////////////////////////////////////////////////////////////////////////
    function DecreaseHealth(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].health = trolls[_trollNumber].health.sub(_amount);
        troll_owner[_key][_trollNumber].health = troll_owner[_key][_trollNumber].health.sub(_amount);
        return trolls[_trollNumber].health;
    }
    
    function DecreaseLifes(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].lifes = trolls[_trollNumber].lifes.sub(_amount);
        troll_owner[_key][_trollNumber].lifes = troll_owner[_key][_trollNumber].lifes.sub(_amount);
        return trolls[_trollNumber].lifes;
    }
    
    function DecreaseStrength(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].strength = trolls[_trollNumber].strength.sub(_amount);
        troll_owner[_key][_trollNumber].strength = troll_owner[_key][_trollNumber].strength.sub(_amount);
        return trolls[_trollNumber].strength;
    }
    
    function DecreasePower(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].power = trolls[_trollNumber].power.sub(_amount);
        troll_owner[_key][_trollNumber].power = troll_owner[_key][_trollNumber].power.sub(_amount);
        return trolls[_trollNumber].power;
    }
    
    function DecreaseSpeed(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].speed = trolls[_trollNumber].speed.sub(_amount);
        troll_owner[_key][_trollNumber].speed = troll_owner[_key][_trollNumber].speed.sub(_amount);
        return trolls[_trollNumber].speed;
    }
    
    function DecreaseAgility(address _key, uint256 _trollNumber, uint8 _amount) public returns (uint256) {
        trolls[_trollNumber].agility = trolls[_trollNumber].agility.sub(_amount);
        troll_owner[_key][_trollNumber].agility = troll_owner[_key][_trollNumber].agility.sub(_amount);
        return trolls[_trollNumber].agility;
    }
    
    // Not Working!
    function LevelDown(address _key, uint256 _trollNumber) public {
        for (uint256 i = 0; i < trolls.length; i++) {
            if (trolls[i].troll_number == _trollNumber) {
                trolls[i].troll_level = trolls[i].troll_level.sub(1);
                troll_owner[_key][_trollNumber].troll_level = troll_owner[_key][_trollNumber].troll_level.sub(1);
                troll_owner[_key][_trollNumber].lifes = troll_owner[_key][_trollNumber].lifes.sub(1);
            }
        }
    }


    // "Update And De-Re Activate Trolls". //////////////////////////////////////////////////////////////////////
    function UpdateTrollType(address _key, uint256 _trollNumber) public returns (bool success) {
        require (trolls[_trollNumber].troll_level >= max_troll_level);
        if (trolls[_trollNumber].troll_level >= max_troll_level) {
            trolls[_trollNumber].type_of = trolls[_trollNumber].type_of.add(1);
            troll_owner[_key][_trollNumber].type_of = troll_owner[_key][_trollNumber].type_of.add(1);
        }
        return true;
    }
    
    function DeadTroll(address _key, uint256 _trollNumber) public {
        trolls[_trollNumber].playable = false;
        troll_owner[_key][_trollNumber].playable = false;
    }
    
    function ReviveTroll(address _key, uint256 _trollNumber) public {
        trolls[_trollNumber].playable = true;
        troll_owner[_key][_trollNumber].playable = true;
    }
    
}
