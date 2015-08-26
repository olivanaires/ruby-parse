require 'minitest/autorun'
require_relative 'parser'

class TestPrinter < MiniTest::Unit::TestCase
  	
    # instancia a classe Printer
    def setup
    	 @printer = Printer.new
  	end

  	# testa o método print_means_kill que imprime as mortes por tipo e game
  	def test_print_means_kill
		  means = {"game_1"=>{:kill_by_means=>{"MOD_ROCKET"=>1}}}
	  	assert_equal means, @printer.print_means_kill('game_teste.log')
	  end

	# testa o método print_rank que imprime o rank por game
  	def test_print_rank
  		rank = {"game_1"=>[[" Isgalamido ", 1]]}
    	assert_equal rank, @printer.print_rank('game_teste.log')
  	end

  	# testa o método print_games que imprime os games e as informações como: jogadores onlines, numero de mortes e numero de mortes por jogador
	def test_print_games
  		game = {"game_1"=>{:total_kills=>"4", :players=>"Dono da Bola, Mocinha, Isgalamido, Zeh", :kills=>{" Isgalamido "=>1}}}
		assert_equal game, @printer.print_games('game_teste.log')
	end
	
end
