class Triangle
  attr_accessor :a, :b, :c, :sides

  def initialize(sides)
    @sides = sides
    @a, @b, @c = *sides
  end

  def equilateral?
    triangle? && a == b && b == c
  end

  def isosceles?
    triangle? && sides.uniq.size <= 2
  end

  def scalene?
    triangle? && sides.uniq.size == 3
  end

  private

  def triangle?
    @sides.sum.positive? && a + b > c && a + c > b && b + c > a
  end
end