require_relative '../reflector'

ALPHABET ||= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
REFLECTOR_B = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'.freeze

describe Reflector do
  describe '#reflect' do
    it 'reflects the letter using the given reflector' do
      reflector = Reflector.new(reflector: 'B')
      (0..25).each do |i|
        output = REFLECTOR_B.index(ALPHABET[i])
        expect(reflector.reflect(i)).to eq output
        expect(reflector.reflect(output)).to eq i
      end
    end
  end

  describe '#right' do
    it 'calls #left method of object to right with correct index' do
      right = double('right')
      reflector = Reflector.new(reflector: 'B', right: right)
      (0..25).each do |i|
        output = REFLECTOR_B.index(ALPHABET[i])
        expect(right).to receive(:left) { output }
        reflector.right(i)
      end
    end
  end
end
