automacro goGetSP {
    CurrentSP < 20%
    InLockMap 1
    timeout 30
    exclusive 1
    ConfigKeyNot route_randomWalk 0
    call {
        do conf -f teleport_search 0
        do conf lockMap_x 364
        do conf lockMap_y 220
        do conf lockMap_randX 5
        do conf lockMap_randY 5
        do conf attackAuto 0
        do conf itemsTakeAuto 0
        do conf route_teleport 1
        do conf route_maxTries 20
        do conf route_teleport_minDistance 100
        do conf route_randomWalk 0
    }
}

automacro goLeveling {
    StatusActiveHandle EFST_BLESSING
    StatusActiveHandle EFST_INC_AGI
	CurrentSP >= 80%
    InLockMap 1
    exclusive 1
    ConfigKeyNot route_randomWalk 1
    call {
		release askForSP
        do conf -f teleport_search 1
        do conf lockMap_x none
        do conf lockMap_y none
        do conf lockMap_randX none
        do conf lockMap_randY none
        do conf attackAuto 2
        do conf itemsTakeAuto 2
        do conf route_teleport 0
        do conf route_randomWalk 1
    }
}

automacro slaveAnswer {
	GuildMsgName /ok/i /PRIESTNAME/
	exclusive 1
	call {
		lock askForSP
	}
}

automacro askForSP {
	timeout 10
    CurrentSP < 80%
    PlayerNearDist /PRIESTNAME/ < 8
    call {
        @possibleTalk = undef
        &push(@possibleTalk,hey i need some sp)
        &push(@possibleTalk,give me sp or die)
        &push(@possibleTalk,show me some sp dood)
        &push(@possibleTalk,hey bro im low sp)
        &push(@possibleTalk,can you please fill my SP sweetheart)
        &push(@possibleTalk,i want SP now! do what you gotta do)
        &push(@possibleTalk,hey babe i want SP give me)
		$qtd = howMuchSPNeeded()
		if ($qtd = already good) stop
        do g $possibleTalk[&rand(0,6)] $qtd times
    }
}

sub howMuchSPNeeded {
	my $percentageSP = $char->sp_percent;
	if ($percentageSP =~ /^(\d)/) {
		if ($1 >= 8) return "already good";
		return 8 - $1;
	}
}