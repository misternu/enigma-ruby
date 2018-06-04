require_relative 'constants'

# Class representing the rotor component of an enigma machine
class Rotor
  attr_reader :position
  def initialize(rotor = 'I', position = 0)
    @scramble = ROTORS[rotor]
    @notch = NOTCHES[rotor]
    @position = position
  end

  def rotate
    @position = (@position + 1) % 26
  end

  def notch
    @notch == position_letter
  end

  def position_letter
    ALPHABET[@position]
  end

  def right_to_left(input)
    input_index = shift(ALPHABET.index(input))
    output_index = ALPHABET.index(@scramble[input_index])
    ALPHABET[unshift(output_index)]
  end

  def left_to_right(input)
    input_index = shift(ALPHABET.index(input))
    output_index = @scramble.index(ALPHABET[input_index])
    ALPHABET[unshift(output_index)]
  end

  def shift(index)
    (index + @position) % 26
  end

  def unshift(index)
    (index - @position) % 26
  end
end
