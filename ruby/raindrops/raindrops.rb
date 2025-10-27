module Raindrops
  def self.convert(number)
    result = ''
    result += 'Pling' if (number % 3).zero?
    result += 'Plang' if (number % 5).zero?
    result += 'Plong' if (number % 7).zero?

    return number.to_s if result == ''

    result
  end
end
