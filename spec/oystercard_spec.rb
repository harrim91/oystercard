require "oystercard"

describe Oystercard do
  subject(:card) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  describe "#initialize" do
    it "has a starting balance" do
      expect(card.balance).to eq Oystercard::INITIAL_BALANCE
    end
    it "has an empty journey history" do
      expect(card.journey_log).to be_empty
    end
  end

  describe "#top_up" do
    context "adding a valid amount" do
      let(:amount) { rand(Oystercard::MAX_BALANCE) }
      it "tops up the balance with the specified amount" do
        card.top_up(amount)
        expect(card.balance).to eq amount
      end
    end

    context "exceeding the maximum balance" do
      before { card.top_up Oystercard::MAX_BALANCE }
      it "raises an error" do
        expect{ card.top_up 1 }.to raise_error Oystercard::MAX_BAL_ERR
      end
      it "does not top up the balance" do
        begin
          card.top_up 1
        rescue
          expect(card.balance).to eq Oystercard::MAX_BALANCE
        end
      end
    end
  end

  describe "#touch_in" do
    context "outside a journey" do
       context "insufficient funds" do
        it "raises an error" do
          expect { card.touch_in entry_station }.to raise_error Oystercard::MIN_BAL_ERR
        end
      end
    end
    context "during a journey" do
      before { card.top_up Oystercard::MAX_BALANCE ; card.touch_in entry_station }
      it "charges a penalty fare" do
        expect{card.touch_in entry_station}.to change{card.balance}
      end
    end
  end

  describe "#touch_out" do
    context "during a journey" do
      before { card.top_up Oystercard::MAX_BALANCE; card.touch_in entry_station }
      let(:journey) {double(:journey)}
      it "reduces the balance" do
        expect { card.touch_out exit_station }.to change { card.balance }
      end
    end
    context "outside a journey" do
      before { card.top_up Oystercard::MAX_BALANCE }
      context "new card" do
        it "reduces the balance" do
          expect { card.touch_out exit_station }.to change { card.balance }
        end
      end
      context "used card" do
        before { card.touch_in entry_station ; card.touch_out exit_station }
        it "reduces the balance" do
          expect { card.touch_out exit_station }.to change { card.balance }
        end
      end
    end
  end
end
