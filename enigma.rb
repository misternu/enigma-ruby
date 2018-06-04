require_relative 'constants'
require_relative 'reflector'

# Class for simulating enigma machines
class Enigma
  def initialize(options = {})
    @reflector = Reflector.new(options.fetch(:reflector, 'B'))
    rotor_names = options.fetch(:rotors, ['I', 'II', 'III'])
    rotor_settings = options.fetch(:settings, ['A', 'A', 'A'])
    @rotor1, @rotor2, @rotor3 = (0..2).map do |i|
      Rotor.new(rotor_names[i], ALPHABET.index(rotor_settings[i]))
    end
  end

  def run(input)
    input.scan(/./).map do |letter|
      if letter == ' '
        ' '
      else
        rotation
        circuit(letter)
      end
    end .join
  end

  def circuit(letter)
    value = @rotor3.right_to_left(letter)
    value = @rotor2.right_to_left(value)
    value = @rotor1.right_to_left(value)
    value = @reflector.reflect(value)
    value = @rotor1.left_to_right(value)
    value = @rotor2.left_to_right(value)
    @rotor3.left_to_right(value)
  end

  def rotation
    @rotor1.rotate if @rotor2.notch
    @rotor2.rotate if @rotor2.notch || @rotor3.notch
    @rotor3.rotate
  end
end
