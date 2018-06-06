require_relative 'constants'
require_relative 'reflector'
require_relative 'rotor'

# Class for simulating enigma machines
class Enigma
  def initialize(options = {})
    setup_rotors(
      options.fetch(:rotors, ['I', 'II', 'III']),
      options.fetch(:settings, ['A', 'A', 'A']).map { |s| ALPHABET.index(s) }
    )
    @reflector = Reflector.new(options)
    # connect_rotors
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
    index = ALPHABET.index(value)
    index = @reflector.reflect(index)
    value = ALPHABET[index]
    value = @rotor1.left_to_right(value)
    value = @rotor2.left_to_right(value)
    @rotor3.left_to_right(value)
  end

  def rotation
    @rotor1.rotate if @rotor2.notch
    @rotor2.rotate if @rotor2.notch || @rotor3.notch
    @rotor3.rotate
  end

  private

  def setup_rotors(rotor_names, rotor_settings)
    @rotor1, @rotor2, @rotor3 = rotor_names.zip(rotor_settings).map do |r, p|
      Rotor.new(rotor: r, position: p)
    end
  end

  def connect_rotors
    @reflector.right_contact = @rotor1
    @rotor1.left_contact = @reflector
    @rotor1.right_contact = @rotor2
    @rotor2.left_contact = @rotor1
    @rotor2.right_contact = @rotor3
    @rotor3.left_contact = @rotor2
  end
end
