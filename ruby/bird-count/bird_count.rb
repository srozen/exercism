class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @current_week = birds_per_day
  end

  def yesterday
    @current_week[-2]
  end

  def total
    @current_week.reduce(:+)
  end

  def busy_days
    @current_week.reduce(0) do |sum, n|
      n >= 5 ? sum + 1 : sum
    end
  end

  def day_without_birds?
    @current_week.find(&:zero?)
  end
end
