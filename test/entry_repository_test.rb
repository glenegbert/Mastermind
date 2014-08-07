gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry_repository'
require_relative '../lib/entry'

class EntryRepositoryTest < Minitest::Test
  def test_generates_a_time_difference
    entries = [
    { name: 'Alice', time: 180, guesses: '9' },
    { name: 'Joe', time: 30, guesses: '4' },
    { name: 'Sam', time: 150, guesses: '20' }
    ].map { |row| Entry.new(row) }

    time_elapsed = 90

    repository = EntryRepository.new(entries)

    assert_equal -30, repository.calculate_time_difference(time_elapsed)
  end

  def test_generates_a_guess_difference
    entries = [
    { name: 'Alice', time: 180, guesses: '9' },
    { name: 'Joe', time: 30, guesses: '4' },
    { name: 'Sam', time: 150, guesses: '20' }
    ].map { |row| Entry.new(row) }

    user_guesses = 19

    repository = EntryRepository.new(entries)

    assert_equal 8, repository.calculate_guess_difference(user_guesses)
  end
end
