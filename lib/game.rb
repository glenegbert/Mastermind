require_relative 'communications'
require_relative 'sequence'
require_relative 'comparerator'
require_relative 'verify'

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

  def get_guess(level)
    guess = gets.chomp.upcase
    if Verify.guess_verified?(guess, level)
      guess
    else
      puts "Invalide Guess, Please Try Again:"
      get_guess(level)
    end

  end

   def determine_level
    loop do
       puts Communications.game_level
       answer = gets.chomp.downcase
       case answer
         when 'b' then play(:beginner)
           break
         when 'i' then play(:intermediate)
           break
         when 'a' then play(:advanced)
           break
         when 'q' then puts Communications.message("q")
           break
         else puts Communications.message("v")
       end
     end
   end

   def play(level)
     time_begin = Time.now
     @code = []
     sequence_gen(level)
     @guess_counter = 0
     printf Communications.game_start_message(level)
     loop do
       answer = get_guess(level)
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
