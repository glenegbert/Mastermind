gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/verify.rb'

class Verify_Test < Minitest::Test

  def test_it_verifys_at_different_levels   
    guess1 = "yyyyy"
    guess2 = "yyyy"
    level1 = :intermediate
    level2 = :beginner
    refute Verify.guess_verified?(guess1, level1)
    assert Verify.guess_verified?(guess2, level2)
  end
end
