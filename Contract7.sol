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
