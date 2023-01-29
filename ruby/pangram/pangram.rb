=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end
require 'set'

module Pangram
  def self.pangram?(sentence)
    sentence.downcase
            .gsub(/[^a-z]/, '')
            .each_char.with_object(Set.new) { |char, set| set.add(char) }
            .length == 26
  end
end