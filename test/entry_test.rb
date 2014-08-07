gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry'

class EntryTest < Minitest::Test
  def test_entry_attributes
    data = {
      name: 'Alice',
      time: '150',
      guesses: '10'
    }
    entry = Entry.new(data)

    assert_equal 'Alice', entry.name
    assert_equal "150", entry.time
    assert_equal "10", entry.guesses
  end
end
