require_relative '../reflector'

ALPHABET ||= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
REFLECTOR_B = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'.freeze

describe Reflector do
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
