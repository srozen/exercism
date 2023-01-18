=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  attr_accessor :rows
  attr_accessor :columns

  def initialize(matrix_string)
    @rows = matrix_string.split("\n")
                         .map { |row| row.split.map(&:to_i) }
  end

  def columns
    @rows.transpose
  end
end