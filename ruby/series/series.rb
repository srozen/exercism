=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
class Series
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def slices(n)
    raise ArgumentError unless (1..@content.length).include? n

    (0..@content.length - n).map { |i| @content.slice(i, n) }
  end
end