require_relative 'constants'

# Class representing the reflector component of an enigma machine
class Reflector
  def initialize(reflector = 'A')
    @scramble = REFLECTORS[reflector]
  end

  def reflect(input)
    @scramble[ALPHABET.index(input)]
  end
end
