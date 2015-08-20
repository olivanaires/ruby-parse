$numberGame=1

def print_report()
	puts "game_#{$numberGame}: {"
	puts "}"
end

def reset_values()
	$numberGame += 1
end

File.foreach( "games.log" ) do |line|
	if line.include? "InitGame"
		print_report()
		reset_values()
	end
end

