require_relative 'constants'
require_relative 'wires'

# Class representing the reflector component of an enigma machine
class Reflector
  attr_accessor :right_contact
  def initialize(options = {})
    reflector = REFLECTORS[options.fetch(:reflector, 'B')]
    @wires = Wires.new(reflector)
    @right_contact = options.fetch(:right, nil)
  end

  def right(index)
    output = @wires.right[index]
    @right_contact.left(output)
  end
end
