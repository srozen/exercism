module ResistorColorDuo
  BANDS = {
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
    color_duo = colors.take(2)
    unless color_duo.all? { |color| BANDS.include? color }
      raise BandColorError, "Available colors are: #{BANDS.keys.join(', ')}"
    end

    color_duo.each_with_object('') { |color, result| result << BANDS[color] }.to_i
  end

  class BandColorError < ArgumentError; end
end
