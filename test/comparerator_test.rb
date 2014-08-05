gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/comparerator.rb'

class CompareratorTest < Minitest::Test
def test_how_many_positions_in_guess_are_correct
   game_code = ["R", "B", "R", "B"]
   guess = ["R", "B", "R", "B"]

   assert_equal  4 , Comparerator.compare_guess_places(guess, game_code)
end

def test_how_many_colors_in_guess_are_correct
    game_code = ["Y", "Y", "Y", "Y"]
    guess = ["Y","Y","R","B"]

    assert_equal 2, Comparerator.compare_guess_colors(guess, game_code)
end

def test_how_many_positions_and_colors_are_correct
    game_code = ["Y", "Y", "Y", "G"]
    guess = "BYYY"
    assert_equal ["BYYY", 2, 3], Comparerator.compare_guess_colors_and_place(guess, game_code)
end

def test_can_compare_different_sized_arrays
  game_code = ["Y", "Y", "Y", "G", "R","R"]
  guess = "BYYYRB"
  assert_equal ["BYYYRB", 3, 4], Comparerator.compare_guess_colors_and_place(guess, game_code)
end

end
