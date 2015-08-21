require 'minitest/autorun'
require_relative 'parser'

class TestMeme < MiniTest::Unit::TestCase
  	
    def setup
    	 @printer = Printer.new
  	end

  	def test_print_means_kill
		  means = {"game_1"=>{:kill_by_means=>{"MOD_ROCKET"=>1}}}
	  	assert_equal means, @printer.print_means_kill('game_teste.log')
	  end

  	def test_print_rank
  		rank = {" Isgalamido "=>1}
    	assert_equal rank, @printer.print_rank('game_teste.log')
  	end

	  def test_print_games
		  game = {"game_1"=>{:total_kills=>"4", :players=>"Dono da Bola, Mocinha, Isgalamido, Zeh", :kills=>{" Isgalamido "=>1}}}
	  	assert_equal game, @printer.print_games('game_teste.log')
	  end
	
end
