require '../lib/logic.rb'

describe Logic do
  let(:logic) { Logic.new }
  describe '#valid_number' do
    let(:rand_num) { rand(1..30) }
    it 'valid number?' do
      expect(logic.number?(rand_num)).to be true
    end

    it 'invalid number_number?' do
      expect(logic.number?(50)).to be false
    end
    it 'invalid string number?' do
      expect(logic.number?('asdsa')).to be false
    end
  end
  let(:logic) { Logic.new }
  describe '#valid_p_s' do
    it 'invalid valid?' do
      expect(logic.validate_p_s('asdsa')).to be false
    end
    it 'invalid valid?' do
      expect(logic.validate_p_s(1)).to be false
    end
  end
end
