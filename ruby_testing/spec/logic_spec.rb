require '../lib/logic.rb'

describe Logic do
    let(:logic) {Logic.new}
    describe '#valid_number' do
        let(:rand_num) {rand(1..30)}
        it 'valid input' do
            allow(logic.validate).to receive(1).and_return(logic.scraper(1))
        end
        it 'invalid input' do
            allow(logic.validate).to receive('asdsa').and_return(logic.scraper(false))
        end
    end

end
