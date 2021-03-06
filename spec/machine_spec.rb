describe Enigma::Machine do
  describe 'example' do
    it 'decodes the example initial setting' do
      enigma = Enigma::Machine.new(settings: ['M', 'C', 'K'])
      expect(enigma.run('E')).to eq 'Q'
    end
    it 'decodes the complete example message' do
      enigma = Enigma::Machine.new(settings: ['M', 'C', 'K'])
      expect(enigma.run('QMJIDO MZWZJFJR')).to eq 'ENIGMA REVEALED'
    end
    it 'does the double step' do
      enigma = Enigma::Machine.new(settings: ['M', 'D', 'U'])
      expect(enigma.run('WDUGU')).to eq 'HELLO'
    end
  end
end
