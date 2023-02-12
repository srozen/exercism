# frozen_string_literal: true
module ArmstrongNumbers
  class << self
    def include?(number)
      digits = number.digits
      power = digits.length

      digits.map { |digit| digit**power }.sum == number
    end
  end
end
