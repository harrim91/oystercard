require 'journey'

describe Journey do
  let (:station) {double :station}
  let (:card_no_money) {double :card}
  let (:card_money) {double :card}
  let (:min_fare) {Oystercard::MIN_FARE}
  describe '#initialize' do
    it 'has an entry station' do
      expect(subject.entry_station).to eq nil
    end
    it 'has an exit station' do
      expect(subject.exit_station).to eq nil
    end
  end
  describe '#start_journey' do
    before{allow(card_money).to receive(:balance) {(min_fare+50)}}
    before{subject.start_journey(station, card_money)}
    it 'should add an entry station' do
      expect(subject.entry_station).to eq(station)
    end
    it 'changes in_journey? to true' do
      expect(subject.in_journey?).to eq true
    end
  end
  describe '#start_journey others' do
    it 'raises error if balance below MIN_FARE' do
      allow(card_no_money).to receive(:balance) {(min_fare-1)}
      expect{subject.start_journey(station, card_no_money)}.to raise_error("Insufficient funds.")
    end
  end

  describe '#end_journey' do
    before{allow(card_money).to receive(:balance) {(min_fare+50)}}
    before{subject.start_journey(station, card_money)}
    it 'changes in_journey? to false' do
      subject.end_journey(station, card_money)
      expect(subject.in_journey?).to eq false
    end
    it 'adds an exit station' do
      subject.end_journey(station, card_money)
      expect(subject.exit_station).to eq(station)
    end
    it 'adds our journey to a hash' do
      subject.end_journey(station, card_money)
      expect(subject.journey_log).to eq({station => station})
    end
    # it 'deducts MIN_FARE' do #do in future testing
    #   expect(subject.end_journey)
    # end
  end
  describe '#in_journey?' do
    before{allow(card_money).to receive(:balance) {(min_fare+50)}}
    before{subject.start_journey(station, card_money)}
    it 'should return true if in_journey' do
      expect(subject.in_journey?).to be true
    end
    it 'should return false if not in_journey' do
     subject.end_journey(station, card_money)
     expect(subject.in_journey?).to eq false
   end
  end
  describe 'fare' do
    it 'returns the minimum fare' do
      expect(subject.fare).to eq (min_fare)
    end
    # it 'deducts penalty fare if no entry station' do
    #   subject.end_journey(station, card_money)

   # end
  end
end