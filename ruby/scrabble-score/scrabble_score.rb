class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    @word.downcase.chars.map { |letter| letter_score(letter) }.reduce(0) { |sum, score| sum + score }
  end

  private

  def letter_score(letter)
    case letter
    when 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'
      1
    when 'd', 'g'
      2
    when 'b', 'c', 'm', 'p'
      3
    when 'f', 'h', 'v', 'w', 'y'
      4
    when 'k'
      5
    when 'j', 'x'
      8
    when 'q', 'z'
      10
    else
      raise ArgumentError, "Invalid letter: #{letter}"
    end
  end
end
