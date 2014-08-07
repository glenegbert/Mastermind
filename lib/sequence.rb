class Sequence
  attr_reader :difficulty  # => nil

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

  def colors(level)
    case
      when level == :beginner then %w(R G B Y)
      when level == :intermediate then %w(P R G B Y)
      when level == :advanced then %w(T P R G B Y)
    end
  end

  def sequence
    (0...length).collect{ colors(@difficulty).sample }
  end

end
