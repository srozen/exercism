class Phrase
  SEPARATORS = /^'|[?!:.,"&@$%^]|'$/.freeze
  attr_accessor :word_count

  def initialize(phrase)
    @word_count = {}
    phrase.gsub(SEPARATORS, ' ').split(' ').each do |word|
      word = word.gsub(/^'|'$/, '').downcase
      word_count.key?(word) ? word_count[word] += 1 : word_count[word] = 1
    end
  end
end
