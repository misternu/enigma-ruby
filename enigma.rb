require_relative 'constants'

# Class for simulating enigma machines
class Enigma
  def initialize

  end

  def self.reflect(reflector, input)
    REFLECTORS[reflector][LETTERS.index(input)]
  end
end
