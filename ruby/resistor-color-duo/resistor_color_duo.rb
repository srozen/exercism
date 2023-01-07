module ResistorColorDuo
  COLOR_VALUES = {
    'black' => '0',
    'brown' => '1',
    'red' => '2',
    'orange' => '3',
    'yellow' => '4',
    'green' => '5',
    'blue' => '6',
    'violet' => '7',
    'grey' => '8',
    'white' => '9'
  }.freeze

  def self.value(colors)
    colors.take(2).map do |color|
      raise ArgumentError, "Available colors are: #{COLOR_VALUES.keys.join(', ')}" unless COLOR_VALUES.include? color

      COLOR_VALUES[color]
    end.join.to_i
  end
end
