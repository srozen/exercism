class Triangle
  attr_reader :sides, :sides_set

  def initialize(sides)
    @sides = sides
    @sides_set = Set.new(sides)
  end

  def equilateral?
    triangle? && sides_set.length == 1
  end

  def isosceles?
    triangle? && sides_set.length <= 2
  end

  def scalene?
    triangle? && sides_set.length == 3
  end

  private

  def triangle?
    sides.all?(&:positive?) && sides.permutation.all? { |p| p[0] + p[1] >= p[2] }
  end
end
