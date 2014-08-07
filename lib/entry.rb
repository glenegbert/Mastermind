require_relative 'entry'

class Entry
  attr_reader :name, :time, :guesses

  def initialize(data)
    @name = data[:name]
    @time = data[:time]
    @guesses = data[:guesses]
  end

end
