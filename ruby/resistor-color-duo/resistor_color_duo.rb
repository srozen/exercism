module ResistorColorDuo
  def self.value(colors)
    colors.take(2).map { |c| value_from_color(c) }.join.to_i
  end

  def self.value_from_color(color)
    case color
    when 'black'
      '0'
    when 'brown'
      '1'
    when 'red'
      '2'
    when 'orange'
      '3'
    when 'yellow'
      '4'
    when 'green'
      '5'
    when 'blue'
      '6'
    when 'violet'
      '7'
    when 'grey'
      '8'
    when 'white'
      '9'
    else
      raise ArgumentError, 'The given color is not a resistance one.'
    end
  end
end
