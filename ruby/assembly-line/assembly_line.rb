class AssemblyLine
  CAR_PRODUCTION = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * CAR_PRODUCTION * success_rate(@speed)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  private

  def success_rate(speed)
    case speed
    when 0..4
      1.0
    when 5..8
      0.9
    when 9
      0.8
    else
      0.77
    end
  end
end
