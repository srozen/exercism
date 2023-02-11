
class Squares
  attr_reader :range
  def initialize(n)
    @range = 1..n
  end

  def square_of_sum
    @range.sum**2
  end

  def sum_of_squares
    @range.map { |n| n**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
