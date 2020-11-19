require_relative '../lib/logic.rb'
require_relative '../lib/check.rb'

describe Logic do
  let(:logic) { Logic.new }
  describe '#scraper' do
    let(:rand_num) { rand(1..3) }
    it 'matches output? with valid input' do
      expect(logic.scraper(rand_num)).to eq(logic.final_array)
    end
  end

  describe '#scraper' do
    let(:rand_num) { rand(1..3) }
    it 'matches output? with invalid input' do
      expect(logic.scraper('cxzc')).to eq([])
    end
  end
end

describe Check do
  let(:check1) { Check.new }
  describe '#loop1' do
    it 'matches output? with valid input s' do
      expect(check1.loop1('s')).to eq('s')
    end
    it 'matches output? with valid input p' do
      expect(check1.loop1('p')).to eq('p')
    end
    it 'matches output? with valid input number' do
      expect(check1.loop1(1)).to eq(1)
    end
    it 'matches output? with valid input yes' do
      expect(check1.loop1('yes')).to eq('yes')
    end
    it 'matches output? with valid input no' do
      expect(check1.loop1('no')).to eq('no')
    end
  end
end
