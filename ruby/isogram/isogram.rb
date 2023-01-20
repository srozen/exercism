=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
module Isogram
  class << self
    def isogram?(word)
      word.downcase.each_char.with_object({}) do |char, collector|
        if char.match(/\w/)
          return false if collector.key?(char)
          collector[char] = char
        end
      end
    end
  end
end