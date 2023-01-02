class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless [first_operand, second_operand].all? { |operand| operand.is_a? Integer }

    begin
      result = compute(first_operand, second_operand, operation)
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError => e
      e.message
    end
  end

  def self.compute(first_operand, second_operand, operation)
    case operation
    when '+'
      first_operand + second_operand
    when '/'
      raise ZeroDivisionError, 'Division by zero is not allowed.' if second_operand.zero?

      first_operand / second_operand
    when '*'
      first_operand * second_operand
    else
      raise UnsupportedOperation
    end
  end

  class UnsupportedOperation < StandardError; end
end
