require_relative '../enigma'

describe Enigma do
  describe 'example' do
    it 'decodes the example initial setting' do
      enigma = Enigma.new(settings: ['M', 'C', 'K'])
      expect(enigma.run('E')).to eq 'Q'
    end
    it 'decodes the complete example message' do
      enigma = Enigma.new(settings: ['M', 'C', 'K'])
      expect(enigma.run('QMJIDO MZWZJFJR')).to eq 'ENIGMA REVEALED'
    end
  end
end
