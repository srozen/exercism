# frozen_string_literal: true

class Grains
  CELL_RANGE = (1..64).freeze

  class << self
    def square(i)
      raise ArgumentError unless CELL_RANGE.include? i

      2**(i - 1)
    end

    def total
      CELL_RANGE.inject do |sum, n|
        sum + 2**(n - 1)
      end
    end
  end
end
