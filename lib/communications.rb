require 'colorize'
class Communications
require_relative 'entry'

  def self.intro_message1
"







     M      M      A    SSSSS  TTTTT  EEEEE  RRRRR  M     M  IIIII  N   N  DDDD
     M M  M M     A A   S        T    E      R   R  M M M M    I    NN  N  D   D
     M M  M M    A   A   SSS     T    EEEEE  RRRR   M M M M    I    NN  N  D   D
     M   M  M    AAAAA      S    T    E      R   R  M  M  M    I    N N N  D   D
     M   M  M   A     A SSSSS    T    EEEEE  R   R  M  M  M  IIIII  N  NN  D DD






  "
  end
  def self.intro_message2
    "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or
    (q)uit?"
  end

  def self.game_start_message(level)
    case level
    when :beginner then "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    when :intermediate then "I have generated an intermediate sequence with six elements made up of five colors: (r)ed,
(g)reen, (b)lue, and (p)purple and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
    when :advanced then "I have generated an advanced sequence with eight elements made up of six colors (r)ed,
(g)reen, (b)lue, (p)purple, (y)yellow and (t)teal. Use (q)uit at any time to end the game.
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
    "Please enter one of the given letters\n"
    end
  end

  def self.time_difference_from_average(time_difference)
    delta = time_difference.abs
    if time_difference > 0
      "#{delta/60} minutes and #{delta%60} seconds longer than average"
    elsif time_difference < 0
      "#{delta/60} minutes and #{delta%60} seconds less than average"
    else
      "the average amount of time"
    end
  end

  def self.guess_difference_from_average(guess_difference)
    delta = guess_difference.abs
    if guess_difference > 0
      "#{delta} more guesses than average"
    elsif guess_difference < 0
      "#{delta} less guesses than average"
    else
      "the average number of guesses"
    end
  end

  def self.end(name,guess,time,guess_count,guess_difference,time_difference)
    message = "Congratulations #{name}! You guessed the sequence '#{guess}' in #{guess_count} guesses, which is #{guess_difference_from_average(guess_difference)},
    over #{time/60} minutes and #{time%60} seconds which is #{time_difference_from_average(time_difference)}. "

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

  def self.get_name
    "What is your name?"
  end

  def self.top_ten(top_ten_array)
    puts "                          TOP TEN FOR YOUR LEVEL".red
    top_ten_array.each do |entry| puts "           #{entry.name}".ljust(28, ".").blue + "Guesses:#{entry.guesses}".ljust(18, ".").blue + "Time:#{entry.time.to_i/60}min. #{entry.time.to_i%60}seconds".blue
    end
    puts "Do you want to (p)lay again or (q)uit?"

  end
end
