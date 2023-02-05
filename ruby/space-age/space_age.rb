# frozen_string_literal: true

class SpaceAge
  attr_reader :earth_age

  EARTH_YEAR_IN_SECONDS = 31_557_600.0

  RELATIVE_AGE_PER_PLANET = {
    'mercury' => 0.2408467,
    'venus' => 0.61519726,
    'mars' => 1.8808158,
    'jupiter' => 11.862615,
    'saturn' => 29.447498,
    'uranus' => 84.016846,
    'neptune' => 164.79132
  }.freeze

  def initialize(age_in_seconds)
    @earth_age = age_in_seconds / EARTH_YEAR_IN_SECONDS
  end

  def on_earth
    earth_age
  end

  RELATIVE_AGE_PER_PLANET.each do |planet, orbital_period|
    define_method "on_#{planet}" do
      earth_age / orbital_period
    end
  end
end
