require_relative 'communications'
require_relative 'sequence'
require_relative 'comparerator'

class Game

   def initialize
     @guess_counter = 0
     @code = []
   end

   def sequence_gen(level)
     @code = Sequence.new(level).sequence
   end

  def won?(answer,code)
    Comparerator.compare_guess_colors_and_place(answer,@code)[1] == 4
  end

   def determine_level
    loop do
       puts Communications.game_level
       answer = gets.chomp.downcase
       case answer
         when 'b' then play(:beginner)
         when 'i' then play(:intermediate)
         when 'a' then play(:advanced)
         when 'q' then puts Communications.message("q")
       end
       break
     end
   end

   def play(level)
     time_begin = Time.now
     @code = []
     sequence_gen(level)
     @guess_counter = 0
     printf Communications.game_start_message(level)
     loop do
       answer = gets.chomp.upcase
       result = Comparerator.compare_guess_colors_and_place(answer,@code)
       if answer == "Q"
         puts Communications.message("q")
         break
       elsif result[1] == @code.length
         time_end = Time.now
         time_elapsed = (time_end - time_begin).to_i
         puts Communications.end(answer,time_elapsed,@guess_counter)
         answer = gets.chomp.upcase
          if answer == "Q"
            puts Communications.message("q")
          elsif answer == "P"
            determine_level
          end
          break
       elsif result[1] <= @code.length
         @guess_counter += 1
         puts Communications.guess(answer, result[1], result[2], @guess_counter)
        end
      end
    end
end
