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
    words.each_with_object(%w[]) do |potential_anagram, saved_anagrams|
      saved_anagrams.push(potential_anagram) if potential_anagram.downcase != word && potential_anagram.downcase.chars.sort == sorted_word
    end
  end
end