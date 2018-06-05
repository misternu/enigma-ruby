require_relative '../reflector'

LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
REFLECTOR_B = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'.freeze

describe Reflector do
  describe '#reflect' do
    it 'reflects the letter using the given reflector' do
      reflector = Reflector.new(reflector: 'B')
      (0..25).each do |i|
        expect(reflector.reflect(LETTERS[i])).to eq REFLECTOR_B[i]
        expect(reflector.reflect(REFLECTOR_B[i])).to eq LETTERS[i]
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
