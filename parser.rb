$numberGame=1
$killCount=0
$players=""
$kills_in_game=Hash.new(0)

def print_report()
	puts "game_#{$numberGame}: {"
	puts "	total_kills: #{$killCount};"
	puts "	players: #{$players};"
	puts "	kills: {"
	$kills_in_game.each { |key, valor| 
		puts "            \"#{key}\": #{valor}," 
	}
	puts "	}"
	puts "}"
end

def concat_nome_players(nome)
	if not $players.include? nome
		if $players != ""
			$players.concat(", ").concat(nome)	
		else
			$players.concat(nome)
		end 
	end
end

def reset_values()
	$numberGame += 1
	$killCount = 0
	$players=""
end

File.foreach( "games.log" ) do |line|
	if line.include? "InitGame"
		print_report()
		reset_values()
	end
	if line.include? "Kill"
		if not line.include? "<world>"
			player = line[/\d: (.*?) /][2..-1]
			$kills_in_game[player] = $kills_in_game[player] + 1
		end
		$killCount += 1
	end
	if line.include? "ClientUserinfoChanged" 
		player = line[/n\\(.*?)\\t/][2..-3]
		concat_nome_players(player)
	end
end

