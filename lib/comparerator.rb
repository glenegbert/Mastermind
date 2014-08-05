class Comparerator

 def self.guess_counter
   @guess_counter = 0
 end

  def self.compare_guess_places(guess, random)
    guess.zip(random).count {|pair| pair[0]==pair[1]}
   end

   def self.compare_guess_colors(guess,random)
     correct_colors = []
     random.each do |letter|
       if guess.include?(letter)
         correct_colors << letter
         guess.delete_at(guess.index(letter))
       end
     end
     correct_colors.length
  end

  def self.compare_guess_colors_and_place(guess,random)
    guess_to_array = guess.split(//)
    [copy(guess),compare_guess_places(guess_to_array, random),compare_guess_colors(guess_to_array, random)]
  end

  def self.copy(element)
    "#{element}"
  end

end
