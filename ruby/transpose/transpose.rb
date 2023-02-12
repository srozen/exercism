# frozen_string_literal: true

module Transpose
  class << self
    def transpose(input)
      return input if input.empty?

      rows = input.gsub(' ', '_').split("\n")
      max_sequence = rows.map(&:length).max

      rows.map { |row| row.ljust(max_sequence) }
          .map(&:chars)
          .transpose
          .map(&:join)
          .map(&:rstrip)
          .join("\n")
          .gsub('_', ' ')
    end
  end
end
