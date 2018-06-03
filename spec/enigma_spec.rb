require_relative '../enigma'

describe Enigma do
  'Initial setting: I-II-III: MCK, Letter E encodes to Q.
  Sample Message: QMJIDO MZWZJFJR
  Output: ENIGMA REVEALED'
  describe 'example' do
    it 'decodes the example initial setting' do
      enigma = Enigma.new(settings: ['M', 'C', 'K'])
      expect(enigma.run('E')).to eq 'Q'
    end
  end
end
