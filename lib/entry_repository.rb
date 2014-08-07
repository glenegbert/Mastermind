
require_relative 'entry'
require 'csv'

class EntryRepository

  attr_reader :entries

  def self.load_entries(level)
    # file = File.join("#{level}", '.csv')
    data = CSV.open("/Users/glenegbert/Dropbox/ruby_projects/mastermind/lib/#{level}.csv", headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    new(rows)
  end

  def initialize(entries)
    @entries = entries
  end

  def calculate_time_difference(time_elapsed)
    time_elapsed - entries.map {|entry| entry.time.to_i}
                          .reduce(:+)/entries.length

  end

  def calculate_guess_difference(guess_counter)
    guess_counter - entries.map {|entry| entry.guesses.to_i}
                          .reduce(:+)/entries.length
  end

end
