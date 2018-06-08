ROTOR_I ||= Enigma::ROTORS['I']

describe Enigma::Rotor do
  describe '#initialize' do
    it 'has the position given during initialization' do
      rotor = Enigma::Rotor.new(position: 5)
      expect(rotor.position).to eq 5
    end
  end

  describe '#rotate' do
    it 'moves the position by 1' do
      rotor = Enigma::Rotor.new(rotor: 'I', position: 0)
      expect { rotor.rotate }.to change { rotor.position }.by(1)
    end
    it 'goes back to 0 after rotating from position 25' do
      rotor = Enigma::Rotor.new(rotor: 'I', position: 25)
      expect { rotor.rotate }.to change { rotor.position }.from(25).to(0)
    end
  end

  describe '#right' do
    it 'finds the output and passes it to the left' do
      left = double('left')
      rotor = Enigma::Rotor.new(left: left)
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
      rotor = Enigma::Rotor.new(right: right)
      (0..25).each do |i|
        output = ROTOR_I.index(ALPHABET[i])
        expect(right).to receive(:left) { output }
        rotor.left(i)
      end
    end
  end
end
