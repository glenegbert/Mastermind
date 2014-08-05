class Sequence
  attr_reader :difficulty

  def initialize(level)
    @difficulty = level
  end

  def length_for_difficulty
    {:beginner     => 4,
     :intermediate => 6,
     :advanced       => 8}
  end

  def length
    length_for_difficulty[difficulty]
  end

  def colors
    %w(R G B Y)
  end

  def sequence
    (0...length).collect{ colors.sample }
  end

end
