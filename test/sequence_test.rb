gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/sequence.rb'

class SequenceTest < Minitest::Test

  def test_it_takes_a_difficulty_level
    sequence = Sequence.new(:expert)
    assert_equal :expert, sequence.difficulty
  end

  def test_the_difficulty_determines_the_length
    sequence = Sequence.new(:beginner)
    assert_equal 4, sequence.length

    sequence2 = Sequence.new(:intermediate)
    assert_equal 6, sequence2.length
  end

  def test_the_difficulty_determines_the_colors
    sequence = Sequence.new(:beginner)
    assert_equal %w(R G B Y).sort, sequence.colors.sort
  end

  def test_it_generates_a_sequence
    sequence = Sequence.new(:beginner)
    assert_equal sequence.length, sequence.sequence.length
    assert sequence.sequence.all?{ |color| sequence.colors.include?(color) }
  end

  def test_it_generates_different_sequences
    sequence = Sequence.new(:beginner)
    results = []
    10.times do
      results << sequence.sequence
    end
    assert results.uniq.count > 1
  end
end
