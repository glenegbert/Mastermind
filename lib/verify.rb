class Verify

  def self.guess_verified?(guess, level)
    guess.split(//).length == 1 || guess.split(//).length == length_for_difficulty[level]
  end

  def self.length_for_difficulty
    {:beginner     => 4,
     :intermediate => 6,
     :advanced       => 8}
  end

def self.length
  length_for_difficulty[difficulty]
end

end
