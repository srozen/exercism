module Pangram
  def self.pangram?(sentence)
    sentence.gsub(/[\d\s\W_-]/, '')
            .strip.downcase
            .chars.uniq.length == 26
  end
end