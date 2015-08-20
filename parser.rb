require 'json'
$games = Hash.new(0)
$kills_in_game=Hash.new(0)
$number_game=1
$kill_count=0
$players=""

def print_report()
	$games["game_#{$number_game}"] = {:total_kills => "#{$kill_count}", :players => "#{$players}", :kills => $kills_in_game}
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
	$number_game += 1
	$kill_count = 0
	$players=""
	$kills_in_game=Hash.new(0)
end

File.foreach( "games.log" ) do |line|
	if line.include? "ShutdownGame"
		print_report()
		reset_values()
	end
	if line.include? "Kill"
		if not line.include? "<world>"
			player = line[/\d: (.*?) /][2..-1]
			$kills_in_game[player] = $kills_in_game[player] + 1
		end
		$kill_count += 1
	end
	if line.include? "ClientUserinfoChanged" 
		player = line[/n\\(.*?)\\t/][2..-3]
		concat_nome_players(player)
	end
end
puts JSON.pretty_generate($games)
