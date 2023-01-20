=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
module Hamming
  def self.compute(dna_sequence_a, dna_sequence_b)
    raise ArgumentError unless dna_sequence_a.length == dna_sequence_b.length

    hamming_distance = 0
    dna_sequence_a.each_char.with_index do |nucleobase_a, index|
      nucleobase_b = dna_sequence_b[index]
      hamming_distance += 1 if nucleobase_a != nucleobase_b
    end
    hamming_distance
  end
end
