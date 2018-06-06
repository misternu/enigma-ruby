require_relative '../rotor'

ROTOR_I ||= ROTORS['I']

describe Rotor do
  describe '#initialize' do
    it 'has the position given during initialization' do
      rotor = Rotor.new(position: 5)
      expect(rotor.position).to eq 5
    end
  end

  describe '#rotate' do
    it 'moves the position by 1' do
      rotor = Rotor.new(rotor: 'I', position: 0)
      expect { rotor.rotate }.to change { rotor.position }.by(1)
    end
    it 'goes back to 0 after rotating from position 25' do
      rotor = Rotor.new(rotor: 'I', position: 25)
      expect { rotor.rotate }.to change { rotor.position }.from(25).to(0)
    end
  end

  describe '#right_to_left' do
    it 'matches the example details' do
      rotor = Rotor.new(rotor: 'III', position: ALPHABET.index('K'))
      rotor.rotate
      expect(rotor.right_to_left('E')).to eq 'T'
      rotor = Rotor.new(rotor: 'II', position: ALPHABET.index('C'))
      expect(rotor.right_to_left('T')).to eq 'W'
      rotor = Rotor.new(rotor: 'I', position: ALPHABET.index('M'))
      expect(rotor.right_to_left('W')).to eq 'J'
    end
  end
  describe '#left_to_right' do
    it 'matches the example details' do
      rotor = Rotor.new(rotor: 'I', position: ALPHABET.index('M'))
      expect(rotor.left_to_right('X')).to eq 'N'
      rotor = Rotor.new(rotor: 'II', position: ALPHABET.index('C'))
      expect(rotor.left_to_right('N')).to eq 'S'
      rotor = Rotor.new(rotor: 'III', position: ALPHABET.index('K'))
      rotor.rotate
      expect(rotor.left_to_right('S')).to eq 'Q'
    end
  end

  describe '#right' do
    it 'finds the output and passes it to the left' do
      left = double('left')
      rotor = Rotor.new(left: left)
      (0..25).each do |i|
        output = ALPHABET.index(ROTOR_I[i])
        expect(left).to receive(:right) { output }
        rotor.right(i)
      end
    end
  end
  describe '#left' do
    it 'finds the output and passes it to the right' do
      right = double('right')
      rotor = Rotor.new(right: right)
      (0..25).each do |i|
        output = ROTOR_I.index(ALPHABET[i])
        expect(right).to receive(:left) { output }
        rotor.left(i)
      end
    end
  end
end
