=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
module Raindrops
  RAINDROP_RULES = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    result = RAINDROP_RULES.each_with_object("") do |(factor, rule), result|
      result << rule if number % factor == 0
    end

    result.empty? ? number.to_s : result
  end
end