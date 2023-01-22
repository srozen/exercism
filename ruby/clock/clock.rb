=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end
class Clock
  MINUTES_IN_HOUR = 60.freeze
  HOURS_IN_DAY = 24.freeze
  MINUTES_IN_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY

  attr_accessor :time_in_minutes
  def initialize(time_in_minutes = 0, **time_options)
    @time_in_minutes = time_in_minutes
    raise ArgumentError unless time_options.values.all? { |val| val.is_a?(Integer) }

    @time_in_minutes += time_options.fetch(:hour, 0) * MINUTES_IN_HOUR + time_options.fetch(:minute, 0)
    @time_in_minutes += MINUTES_IN_DAY while @time_in_minutes <= 0 # reset to positive
    @time_in_minutes %= MINUTES_IN_DAY # loopback
  end

  def to_s
    "#{hours.to_s.rjust(2, "0")}:#{minutes.to_s.rjust(2, "0")}"
  end

  def +(clock)
    Clock.new(@time_in_minutes + clock.time_in_minutes)
  end

  def -(clock)
    Clock.new(@time_in_minutes - clock.time_in_minutes)
  end

  def ==(clock)
    @time_in_minutes == clock.time_in_minutes
  end

  def hours
    @time_in_minutes / MINUTES_IN_HOUR % 24 # 24:00 is displayed 00:00
  end

  def minutes
    @time_in_minutes % MINUTES_IN_HOUR
  end
end