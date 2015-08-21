require_relative 'parser'

metode = ARGV[0]
file_name = ARGV[1]
p = Printer.new

if metode.include? "print_games"
	puts JSON.pretty_generate(p.print_games(file_name))
elsif metode.include? "print_means_kill"
	puts JSON.pretty_generate(p.print_means_kill(file_name))
elsif metode.include? "print_rank"
	puts JSON.pretty_generate(p.print_rank(file_name))
end