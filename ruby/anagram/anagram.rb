=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end
class Anagram
  attr_accessor :word, :sorted_word

  def initialize(word)
    @word = word.downcase
    @sorted_word = @word.chars.sort
  end

  def match(words)
    words.select { |potential_anagram| is_anagram?(potential_anagram) }
  end

  private

  def is_anagram?(anagram)
    anagram.downcase != word && anagram.downcase.chars.sort == sorted_word
  end
end