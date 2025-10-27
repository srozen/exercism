module Isogram
  def self.isogram?(input)
    check = {}
    input.gsub(/[-\s]/, '').downcase.chars do |char|
      return false if check[char]

      check[char] = true
    end

    true
  end
end
