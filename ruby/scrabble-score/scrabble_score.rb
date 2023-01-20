=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end
class Scrabble
  attr_accessor :word

  SCRABBLE_VALUES = [
    %w[A E I O U L N R S T].map {|i| [i, 1]}.to_h,
    %w[D G].map {|i| [i, 2]}.to_h,
    %w[B C M P].map {|i| [i, 3]}.to_h,
    %w[F H V W Y].map {|i| [i, 4]}.to_h,
    %w[K].map {|i| [i, 5]}.to_h,
    %w[J X].map {|i| [i, 8]}.to_h,
    %w[Q Z].map {|i| [i, 10]}.to_h
  ].reduce(Hash.new, :merge).freeze


  def initialize(word)
    @word = word
  end

  def score
    @word.upcase
         .each_char
         .reduce(0) { |sum, char|  sum + SCRABBLE_VALUES[char] }
  end
end