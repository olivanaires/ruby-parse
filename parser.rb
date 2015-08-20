require 'json'
$games = Hash.new(0)
$means_kill_games = Hash.new(0)
$kills_in_game=Hash.new(0)
$kill_by_means=Hash.new(0)
$number_game=1
$kill_count=0
$players=""

# metodo que adiciona um game com o total de kills, os players onlines e a quantidade de kills por player ao hash de games
# tambem adiciona a quantidade de mortes por meio ao hash de means_kill_game
def print_report()
	$games["game_#{$number_game}"] = {:total_kills => "#{$kill_count}", :players => "#{$players}", :kills => $kills_in_game}
	$means_kill_games["game_#{$number_game}"] = {:kill_by_means => $kill_by_means}
end

# metodo que concatena os players onlines para ser adiconado ao game
def concat_nome_players(nome)
	if not $players.include? nome
		if $players != ""
			$players.concat(", ").concat(nome)	
		else
			$players.concat(nome)
		end 
	end
end

# zera o valor das variaveis a cada finalização de game
def reset_values()
	$players=""
	$number_game += 1
	$kill_count = 0
	$kills_in_game=Hash.new(0)
	$kill_by_means=Hash.new(0)
end

# le linha a linha do arquivo game.log
File.foreach( "games_teste.log" ) do |line|	
	if line.include? "ShutdownGame"
		print_report()
		reset_values()
	end

	if line.include? "Kill"
		$kill_count += 1
		if not line.include? "<world>"
			player = line[/\d: (.*?) /][2..-1]
			$kills_in_game[player] = $kills_in_game[player] + 1
			means = line[/by (.*?)$/][3..-1]
			$kill_by_means[means] = $kill_by_means[means] + 1
		end		
	end

	if line.include? "ClientUserinfoChanged" 
		player = line[/n\\(.*?)\\t/][2..-3]
		concat_nome_players(player)
	end
end

#imprime os dois hash no formato JSON
puts JSON.pretty_generate($games)
puts JSON.pretty_generate($means_kill_games)
