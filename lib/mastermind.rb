require_relative 'communications'
require_relative 'game'

game = Game.new
puts Communications.intro_message
loop do
  answer = gets.chomp.downcase
  case answer
  when 'q'
    puts Communications.message("q")
    break
  when 'p'
    game.play
    break
  when 'i'
    puts Communications.message("i")
  else
    puts Communications.message("v")
  end
end
