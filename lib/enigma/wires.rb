module Enigma
  # Class representing the wire connections inside a reflector or rotor
  class Wires
    attr_reader :right, :left
    def initialize(scramble)
      @right = {}
      @left = {}
      generate_connections(scramble)
    end

    private

    def generate_connections(scramble)
      scramble.split('').each_with_index do |letter, index|
        other_index = ALPHABET.index(letter)
        @right[index] = other_index
        @left[other_index] = index
      end
      @right.freeze
      @left.freeze
    end
  end
end
