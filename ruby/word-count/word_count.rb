=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  attr_accessor :sentence
  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    @sentence.scan(/\w+'?\w+|\w+/).each_with_object({}) do |element, hash|
      key = element.downcase
      hash[key] = hash[key].to_i + 1
    end
  end
end