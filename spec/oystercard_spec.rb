require 'oystercard'

describe Oystercard do
subject(:card) {Oystercard.new}
it { is_expected.to respond_to(:top_up) }
let (:station) {double :station}


	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(card.balance).to eq(0)
	  end
    it 'has an empty list of journeys' do
      expect(card.journey_log).to eq ({})
    end
	end

	describe '#top_up' do

		it 'allows putting money on oystercard' do
			expect{card.top_up(3)}.to change{card.balance}.by(3)
		end
		it "can only top up to a maximum of £90" do
			max_balance = Oystercard::MAX_BALANCE
			card.top_up(max_balance)
			expect{card.top_up(6)}.to raise_error "Can't top up over £#{max_balance}"
		end
	end
end

