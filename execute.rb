require_relative 'parser'
# utilizado para executar o metodo de acordo com os parametros passados na linha de comando
metode = ARGV[0]
file_name = ARGV[1]
p = Printer.new

if metode.include? "print_games"
	puts JSON.pretty_generate(p.print_games(file_name))
elsif metode.include? "print_means_kill"
	puts JSON.pretty_generate(p.print_means_kill(file_name))
elsif metode.include? "print_rank"
	list_game_rank = p.print_rank(file_name)
	list_game_rank.each{|key, value|
		puts key
		value.each{|key, value|
			puts "#{key} - #{value}"
		}
	}
else
	puts "opções erradas"
end