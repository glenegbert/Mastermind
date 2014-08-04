require_relative 'communications'

class Game

   def initialize
     @guess_counter = 0
     @code = []
   end

   def sequence_gen
       colors = ["R","Y","G","B"]
       4.times do
       letter = colors.sample
        @code << letter
       end
       @code
   end

   def compare_guess_places(guess, random)
      correct_place = []
      combined = guess.zip(random)
      combined.each do |pair|
        if pair[0] == pair[1]
          correct_place << pair
        end
      end
       correct_place.length
    end

    def compare_guess_colors(guess,random)
      correct_colors = []
      random.each do |letter|
        if guess.include?(letter)
          correct_colors << letter
          guess.delete_at(guess.index(letter))
        end
      end
      correct_colors.length
   end

   def compare_guess_colors_and_place(guess,random)
     @guess_counter += 1
     guess1 = copy(guess)
     cpositions = compare_guess_places(guess, random)
     ccolors = compare_guess_colors(guess, random)
     [guess1, cpositions, ccolors]

   end

   def copy(element)
     "#{element.join}"
   end

   def play
     time_begin = Time.now
     @code = []
     sequence_gen
     @guess_counter = 0
     printf Communications.message("p")
     loop do
       answer = gets.chomp.upcase
       answer_to_a = answer.split(//)
       result = compare_guess_colors_and_place(answer_to_a,@code)
       if answer == "Q"
         puts Communications.message("q")
         break
       elsif result[1] == 4
         time_end = Time.now
         time_elapsed = time_end - time_begin
         integer_time = time_elapsed.to_i
         puts Communications.end(answer,integer_time,@guess_counter)
         answer = gets.chomp.upcase
          if answer == "Q"
            puts Communications.message("q")
          elsif answer == "P"
            play
          end
          break
       elsif result[1] <= 4
         puts Communications.guess(answer, result[1], result[2], @guess_counter)
        end
      end
    end
end
