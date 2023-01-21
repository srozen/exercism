=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
module Luhn
  class << self
    def valid?(number)
      sanitized_number = number.gsub(/\s+/, "").reverse
      return false if sanitized_number.length <= 1 || sanitized_number.match?(/\D/)

      sanitized_number.each_char.with_index.inject(0) { |acc, (num, index)| acc + luhn_number(num, index) } % 10 == 0
    end

    private

    def luhn_number(char_number, index)
      number = char_number.to_i
      if index % 2 == 0
        number
      else
        doubled_number = number * 2
        doubled_number >= 10 ? doubled_number - 9 : doubled_number
      end
    end
  end
end