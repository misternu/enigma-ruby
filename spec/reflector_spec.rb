require_relative '../reflector'

describe Reflector do
  describe '#reflect' do
    describe '#reflect' do
      it 'reflects the letter using the given reflector' do
        letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        reflector_b = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'
        reflector = Reflector.new('B')
        (0..25).each do |i|
          expect(reflector.reflect(letters[i])).to eq reflector_b[i]
          expect(reflector.reflect(reflector_b[i])).to eq letters[i]
        end
      end
    end
  end
end
