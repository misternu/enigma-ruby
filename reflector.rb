require_relative 'constants'

# Class representing the reflector component of an enigma machine
class Reflector
  def initialize(options = {})
    @scramble = REFLECTORS[options.fetch(:reflector, 'B')]
    generate_wires
    @right = options.fetch(:right, nil)
  end

  def reflect(input)
    @scramble[ALPHABET.index(input)]
  end

  def right(index)
    output = index + @wires[index]
    @right.left(output)
  end

  private

  def generate_wires
    @wires = {}
    @scramble.split('').each_with_index do |letter, index|
      next if @wires.key? index
      other_index = ALPHABET.index(letter)
      difference = other_index - index
      @wires[index] = difference
      @wires[other_index] = -difference
    end
  end
end
