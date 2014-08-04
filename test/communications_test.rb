gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/communications.rb'

class IntegrationTest < Minitest::Test

  def test_returns_introductory_instructions
    assert Communications.intro_message.downcase.include?("welcome")
  end

  def test_inputs_i_returns_instructions
    assert_equal "MasterMind is a game! Please enter (p)lay or (q)uit", Communications.message("i")
  end

  def test_input_q_returns_thank_you_message
    assert_equal "Thanks for playing!", Communications.message("q")
  end

  def test_input_p_returns_guess_prompt
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?", Communications.message("p")
  end

  def test_other_input_returns_invalid_message
    assert_equal "please enter 'q','p' or 'i'", Communications.message("v")
  end
  def test_input_e_returns_end_of_game_message
    guess = "GRRB"
    guess_count = 8
    time = 245
    assert_equal "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes and 5 seconds. Do you want to (p)lay again or (q)uit?", Communications.end(guess,time,guess_count)
  end

  def test_message_is_returned_after_a_guess
    guess = "YYYY"
    guess_count = 3
    correct_positions = 1
    correct_colors = 2
    assert_equal "'YYYY' has 2 of the correct elements with 1 in the correct positions. You've taken 3 guess. Please guess again.", Communications.guess(guess, correct_positions, correct_colors, guess_count)
  end
end
