module Luhn
  def self.valid?(number)

    stripped_number = number.gsub(' ', '')
    return false if stripped_number.length <= 1
    return false unless stripped_number.match(/\D/).nil?


    sum = 0
    stripped_number.reverse.chars.each_with_index do |char, idx|
      num = char.to_i
      if not idx.even?
        num *= 2
        sum += num >= 10 ? num - 9 : num
      else
        sum += num
      end
    end

    sum % 10 == 0
  end
end