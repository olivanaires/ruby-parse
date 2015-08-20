$numberGame=1
$killCount=0
$players=""

def print_report()
	puts "game_#{$numberGame}: {"
	puts "	total_kills: #{$killCount};"
	puts "	players: #{$players};"
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
		$killCount += 1
	end
	if line.include? "ClientUserinfoChanged" 
		nome = line[/n\\(.*?)\\t/][2..-3]
		concat_nome_players(nome)
	end
end

