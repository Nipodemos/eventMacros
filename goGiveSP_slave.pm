automacro husbandNear {
	GuildMsgName /sp.+\d times/i /MASTERNAME/
	exclusive 1
	call {
		pause 1
		do g ok
		$qtd = getAmountOfTimes($.GuildMsgNameLastMsg)
		if ($qtd = problem) {
			[
			log ===================================
			log = some error happened, call nipodemos
			log ===================================
			]
			stop
		}
		$i = 1
		while ($i < $qtd) {
			pause 6
			do sp iloveyou &player(MASTERNAME)
			$i++
		}
		pause 1
		do sp bless &player(MASTERNAME)
		do sp agi &agi(MASTERNAME)
	}
}

getAmountOfTimes {
	my ($msg) = @_;
	if ($msg =~ /(\d) times/) {
		return $1;
	} else {
		return "problem";
	}
}