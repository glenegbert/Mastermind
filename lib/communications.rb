class Communications

  def self.intro_message
    "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or
    (q)uit?"
  end

  def self.game_start_message(level)
    case level
    when :beginner then "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    when :intermediate then "I have generated an intermediate sequence with six elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    when :advanced then "I have generated an advanced sequence with eight elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    end
  end

  def self.message(command)
    if command == "p"
    "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    elsif command == "i"
    "MasterMind is a game! Please enter (p)lay or (q)uit"
    elsif command == "q"
    "Thanks for playing!"
  elsif command == "v"
    "please enter 'q','p' or 'i'"
    end
  end

  def self.end(guess,time,guess_count)
    "Congratulations! You guessed the sequence '#{guess}' in #{guess_count} guesses over #{time/60} minutes and #{time%60} seconds. Do you want to (p)lay again or (q)uit?"
  end

  def self.guess(guess, correct_positions, correct_colors, guess_count)
  "'#{guess}' has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. You've taken #{guess_count} guess. Please guess again."
  end

  def self.invalid
  "invalid answer, please enter a combination of GRYB or (q)guit"
  end

  def self.game_level
  "What level would you like to play
    (b)beginnger - 4 positions, (i)intermediate - 6 positions, (a) advanced - 8 positions"
  end
end
