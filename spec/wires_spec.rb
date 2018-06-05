require_relative '../wires'

ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
REFLECTOR_B = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'.freeze
ROTOR_I = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ'.freeze

describe Wires do
  it 'represents the wire connections in a reflector' do
    wires = Wires.new(REFLECTOR_B)
    (0..25).each do |i|
      output = ALPHABET.index(REFLECTOR_B[i])
      expect(wires.right[i]).to eq output
    end
  end

  it 'represents the wire connections in a rotor' do
    wires = Wires.new(ROTOR_I)
    (0..25).each do |i|
      output = ALPHABET.index(ROTOR_I[i])
      expect(wires.right[i]).to eq output
      expect(wires.left[output]).to eq i
    end
  end
end
