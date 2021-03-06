require_relative 'communications'
require_relative 'sequence'
require_relative 'comparerator'
require_relative 'verify'
require_relative 'entry_repository'
require 'csv'

class Game

   def initialize
     @guess_counter = 0
     @code = []
     @time_elapsed = 0
     @@guesses ||= []
     @@times ||= []
     @@names ||=[]
   end

   def start
    puts Communications.intro_message1.green
    sleep(2)
    puts Communications.intro_message2.blue
     loop do
       answer = gets.chomp.downcase
       case answer
       when 'q'
         break
       when 'p'
         determine_level
         break
       when 'i'
         puts Communications.message("i")
       else
         puts Communications.message("v")
       end
     end
   puts Communications.message("q")
   end

   def determine_level
    loop do
       puts Communications.game_level.yellow
       answer = gets.chomp.downcase
       case answer
         when 'b' then play(:beginner)
           break
         when 'i' then play(:intermediate)
           break
         when 'a' then play(:advanced)
           break
         when 'q' then puts ""
           break
         else puts Communications.message("v")
       end
     end
   end

   def play(level)
     @time_elapsed = 0
     time_begin = Time.now
     @code = []
     sequence_gen(level)
     @guess_counter = 0
     puts @code
     printf Communications.game_start_message(level).red
     loop do
       answer = get_guess(level)
       result = Comparerator.compare_guess_colors_and_place(answer,@code)
       if answer == "Q"
         break
       elsif result[1] == @code.length
         repository = EntryRepository.load_entries(level)
         @guess_counter += 1
         time_end = Time.now
         puts Communications.get_name
         name = gets.strip
         @time_elapsed = (time_end - time_begin).to_i
         time_difference = repository.calculate_time_difference(@time_elapsed)
         guess_difference = repository.calculate_guess_difference(@guess_counter)
         save_game_informations(level,name,@time_elapsed,@guess_counter)
         repository = EntryRepository.load_entries(level)
         puts Communications.end(name,answer,@time_elapsed,@guess_counter,guess_difference,time_difference)
         Communications.top_ten(repository.top_ten_array)
         answer = gets.chomp.upcase
          if answer == "Q"
            puts ""
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

   def save_game_informations(to_file="mastermind_game_data.csv",name,time,guesses)
     File.open("/Users/glenegbert/Dropbox/ruby_projects/mastermind/lib/#{to_file}.csv", "ab") do  |file|
     file.puts "#{name},#{time},#{guesses}"
     end
   end

end
