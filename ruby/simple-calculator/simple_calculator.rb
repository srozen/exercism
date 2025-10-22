class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless [first_operand, second_operand].all? do |operand|
      operand.is_a?(Numeric)
    end

    if operation == '/' and second_operand == 0
      return "Division by zero is not allowed."
    end

    result = case operation
    when '+'
      first_operand + second_operand
    when '*'
      first_operand * second_operand
    when '/'
      first_operand / second_operand
    else
      raise UnsupportedOperation.new
    end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end

  class UnsupportedOperation  < StandardError; end
end

