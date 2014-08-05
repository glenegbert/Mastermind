require_relative 'communications'
require_relative 'game'
require 'colorize'

game = Game.new
puts Communications.intro_message1.green
puts Communications.intro_message2.blue

loop do
  answer = gets.chomp.downcase
  case answer
  when 'q'
    puts Communications.message("q")
    break
  when 'p'
    game.determine_level
    break
  when 'i'
    puts Communications.message("i")
  else
    puts Communications.message("v")
  end
end
