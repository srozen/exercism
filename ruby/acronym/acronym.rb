module Acronym
  def self.abbreviate(term)
    term.gsub('-', ' ').gsub(/[_.\/,]/, '')
        .split(' ')
        .map { |elem| elem[0] }
        .join.upcase
  end
end