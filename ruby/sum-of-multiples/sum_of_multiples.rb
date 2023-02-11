# frozen_string_literal: true

class SumOfMultiples
  attr_reader :divisors

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    return 0 if @divisors.include? 0

    (1..limit - 1).filter { |n| divisible_by?(n, divisors) }.sum
  end

  private

  def divisible_by?(number, divisors)
    divisors.any? { |divisor| (number % divisor).zero? }
  end
end
