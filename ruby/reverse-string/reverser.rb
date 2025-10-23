module Reverser
  def self.reverse(string)
    self._reverse(string)
  end

  def self._reverse(string, acc = "")
    string == "" ? acc : _reverse(string[1..], acc.prepend(string[0]))
  end
end