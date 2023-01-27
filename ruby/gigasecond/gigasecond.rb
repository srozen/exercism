=begin
Write your code for the 'Gigasecond' exercise in this file. Make the tests in
`gigasecond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/gigasecond` directory.
=end
class Integer
  # Monkeypatch Integer to add gigasecond unit
  def gigaseconds
    self*10**9
  end

  alias :gigasecond :gigaseconds
end

module Gigasecond
  class << self
    def from(time)
      time + 1.gigasecond
    end
  end
end