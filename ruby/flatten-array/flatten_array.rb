module FlattenArray
  class << self
    def flatten(array)
      result = []
      until array.empty?
        element = array.pop
        if element.kind_of?(Array)

        else
          result.push(element)
        end
      end
      result.reverse
    end

    private

    def flatt(array, accumulator)

    end
  end
end
