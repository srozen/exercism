class Clock
  attr_reader :hours, :minutes

  def initialize(hour: 0, minute: 0)
    total_minutes = hour * 60 + minute

    @minutes = total_minutes % 60
    @hours = (total_minutes / 60) % 24
  end

  def to_s
    format('%02d:%02d', @hours, @minutes)
  end

  def ==(other)
    other.instance_of?(self.class) && [@hours, @minutes] == [other.hours, other.minutes]
  end

  def +(other)
    Clock.new(hour: @hours + other.hours, minute: @minutes + other.minutes)
  end

  def -(other)
    Clock.new(hour: @hours - other.hours, minute: @minutes - other.minutes)
  end
end