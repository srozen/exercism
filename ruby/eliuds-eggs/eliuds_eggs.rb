module EliudsEggs
  def self.egg_count(n)
    EliudsEggs.egg_count_helper(n)
  end

  def self.egg_count_helper(n, accumulator = 0)
    return accumulator if n <= 0

    accumulator += 1 if n % 2 == 1
    egg_count_helper(n / 2, accumulator)
  end
end
