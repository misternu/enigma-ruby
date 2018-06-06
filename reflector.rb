require_relative 'constants'
require_relative 'wires'

# Class representing the reflector component of an enigma machine
class Reflector
  def initialize(options = {})
    reflector = REFLECTORS[options.fetch(:reflector, 'B')]
    @wires = Wires.new(reflector)
    @right = options.fetch(:right, nil)
  end

  def reflect(index)
    @wires.right[index]
  end

  def right(index)
    output = @wires.right[index]
    @right.left(output)
  end
end
