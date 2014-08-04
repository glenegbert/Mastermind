gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/game.rb'

class GameTest < Minitest::Test

  def test_sequence_gen_creates_random_sequence
    game = Game.new
    game2 = Game.new
    array1 = game.sequence_gen
    array2 = game2.sequence_gen
    assert array1.length == array2.length, "array lengths don't match"
    assert array2 != array1, "generating equivalent arrays"
  end

  def test_how_many_positions_in_guess_are_correct
     game = Game.new
     game_code = ["R", "B", "R", "B"]
     guess = ["R","B","R","B"]

     assert_equal  4 , game.compare_guess_places(guess, game_code)
  end

  def test_how_many_colors_in_guess_are_correct
      game = Game.new
      game_code = ["Y", "Y", "Y", "Y"]
      guess = ["R","Y","Y","B"]

      assert_equal 2, game.compare_guess_colors(guess, game_code)
  end

  def test_how_many_positions_and_colors_are_correct
      game = Game.new
      game_code = ["Y", "Y", "Y", "G"]
      guess = ["B","Y","Y","Y"]
      assert_equal ["BYYY", 2, 3], game.compare_guess_colors_and_place(guess, game_code)
  end

  def test_that_time_elapsed_during_game_is_recorded
    game = Game.new

      a = game.time_begin
      10000.times {game.sequence_gen}
      b = game.time_end
      time_elapsed = b - a
     refute time_elapsed == 0
  end
end
