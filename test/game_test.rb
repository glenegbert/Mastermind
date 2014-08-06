gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/game.rb'
require_relative '../lib/verify.rb'

class GameTest < Minitest::Test

  def test_sequence_gen_creates_random_sequence

    game = Game.new
    game2 = Game.new
    array1 = game.sequence_gen(:advanced)
    array2 = game2.sequence_gen(:advanced)
    assert array1.length == array2.length, "array lengths don't match"
    assert array2 != array1, "generating equivalent arrays"
  end

  def test_win_on_the_first_guess
    game = Game.new
    secret = game.sequence_gen(:beginner)
    user_guess = secret.join
    Comparerator.compare_guess_colors_and_place(user_guess,secret)
    assert game.won?(user_guess,secret)
  end

  def test_first_guess_has_one_wrong_element
    game = Game.new
    secret = %w(Y Y Y Y)
    user_guess  = "GYYG"
    feedback = Comparerator.compare_guess_colors_and_place(user_guess,secret)
    assert_equal 2, feedback[1]
    assert_equal 2, feedback[2]
    refute game.won?(user_guess, secret)
  end

  def test_saves_player_info_to_csv_file
    
  end
end
