require_relative '../enigma'

describe Enigma do
  describe '#reflect' do
    it 'reflects the letter using the given reflector' do
      letters = ('A'..'Z').to_a.join
      reflector_b = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'
      (0..25).each do |i|
        expect(Enigma.reflect('B', letters[i])).to eq reflector_b[i]
        expect(Enigma.reflect('B', reflector_b[i])).to eq letters[i]
      end
    end
  end
end
