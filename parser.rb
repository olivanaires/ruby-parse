$numberGame=1
$killCount=0

def print_report()
	puts "game_#{$numberGame}: {"
	puts "	total_kills: #{$killCount};"
	puts "}"
end

def reset_values()
	$numberGame += 1
	$killCount = 0
end

File.foreach( "games.log" ) do |line|
	if line.include? "InitGame"
		print_report()
		reset_values()
	end
	if line.include? "Kill"
		$killCount += 1
	end
end

