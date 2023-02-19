module FlattenArray
  class << self
    def flatten(array)
      accumulator = []
      array.compact.each { |element| flat(element, accumulator) }
      accumulator
    end

    private

    def flat(element, accumulator)
      if element.is_a?(Array)
        return if element.empty?

        element.compact.each { |elem| flat(elem, accumulator) }
      else
        accumulator << element
      end
    end
  end
end
