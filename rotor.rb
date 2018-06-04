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
    ALPHABET[(ALPHABET.index(@scramble[(ALPHABET.index(input) + @position) % 26]) - @position) % 26]
    # @scramble[(ALPHABET.index(input) + @position) % 26]
  end

  def left_to_right(input)
    ALPHABET[(@scramble.index(ALPHABET[(ALPHABET.index(input) + @position) % 26]) - @position) % 26]
  end
end
