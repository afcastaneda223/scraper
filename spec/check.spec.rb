require_relative '../lib/check.rb'

describe Check do
  let(:check1) { Check.new }
  describe '#loop1' do
    it 'matches output? with valid input' do
      expect(check1.loop1(1)).tonot eq('s')
    end
  end
end
