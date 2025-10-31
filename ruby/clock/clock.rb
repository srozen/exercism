class Clock
  attr_reader :hours, :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = minute % 60
    @hours = (hour + minute / 60) % 24
  end

  def to_s
    "#{@hours.to_s.rjust(2, '0')}:#{@minutes.to_s.rjust(2, '0')}"
  end

  def ==(other)
    self.class == other.class && state == other.state
  end

  def +(other)
    minutes = @minutes + other.minutes
    @minutes = (minutes) % 60
    @hours = (@hours + other.hours + (minutes) / 60) % 24
    self
  end

  def -(other)
    minutes = @minutes - other.minutes
    @minutes = minutes % 60
    @hours = (@hours - other.hours + minutes / 60) % 24
    self
  end

  protected

  def state
    [@hours, @minutes]
  end
end