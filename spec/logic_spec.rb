require_relative '../lib/logic.rb'

describe Logic do
  let(:logic) { Logic.new }
  describe '#scraper' do
    let(:rand_num) { rand(1..3) }
    it 'matches output?' do
      expect(logic.scraper(rand_num)).to eq(logic.final_array)
    end
  end
end
