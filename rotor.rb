require_relative 'constants'

# Class representing the rotor component of an enigma machine
class Rotor
  attr_reader :position
  attr_accessor :left_contact, :right_contact
  def initialize(options = {})
    @scramble = ROTORS[options.fetch(:rotor, 'I')]
    @wires = Wires.new(@scramble)
    @notch = NOTCHES[options.fetch(:rotor, 'I')]
    @position = options.fetch(:position, 0)
    @left_contact = options.fetch(:left, nil)
    @right_contact = options.fetch(:right, nil)
  end

  def rotate
    @position = shift(1)
  end

  def notch
    @notch == ALPHABET[@position]
  end

  def right(index)
    output = unshift(@wires.right[shift(index)])
    @left_contact.right(output)
  end

  def left(index)
    output = unshift(@wires.left[shift(index)])
    return output unless @right_contact
    @right_contact.left(output)
  end

  def shift(index)
    (index + @position) % 26
  end

  def unshift(index)
    (index - @position) % 26
  end
end
