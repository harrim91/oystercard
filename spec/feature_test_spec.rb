require 'oystercard'

describe "FEATURE TEST" do
  subject(:card) {Oystercard.new}
  let (:station) {double :station}
  #   describe "FT deducting a fair" do
  #   #   it "deducts my fare from my card for a journey" do
  #   #     card.top_up(50)
  #   #     expect(card.balance).to eq 50
  #   #     card.deduct_fare(10)
  #   #     expect(card.balance).to eq 40
  #   #     expect {card.deduct_fare(45)}.to raise_error "Not enough credit on card"
  #   #     expect(card.balance).to eq 40
  #   # end
  #     describe "FT Touchs in and out" do
  #       before {card.top_up(50)}
  #       before {card.touch_in(station)}
  #       it "touches in" do
  #       expect(card).to be_in_journey
  #       expect{card.touch_in(station)}.to raise_error "card already in journey"
  #       end
  #       it "touches out" do
  #       card.touch_out(station)
  #       expect(card).not_to be_in_journey
  #       expect{card.touch_out(station)}.to raise_error "card not in journey"
  #     end

  #   end
  #     describe "FT should have a minimum amount" do
  #       it "should have a minimum of £#{Oystercard::MIN_FARE} on the card" do
  #         expect{card.touch_in(station)}.to raise_error "not enough money on the card min balance of £#{Oystercard::MIN_FARE}"
  #       end
  #   end
  #     describe "FT deducting fare" do
  #       it "touching out deducts from the balance" do
  #       card.top_up(50)
  #       card.touch_in(station)
  #       expect{card.touch_out(station)}.to change{card.balance}.by(-Oystercard::MIN_FARE)
  #     end
  #   end
  #     describe "FT Rememebers the station on touch in" do
  #      it "stores the station when you touch in" do
  #       card.top_up(50)
  #       card.touch_in(station)
  #       expect(card.entry_station).to eq station
  #     end
  #   end
  # end
end