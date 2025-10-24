module EliudsEggs
  def self.egg_count(n, accumulator = 0)
    return accumulator if n <= 0

    accumulator += 1 if n % 2 == 1
    EliudsEggs.egg_count(n / 2, accumulator)
  end
end
