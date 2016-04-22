require 'journey'

describe Journey do
  let(:entry_station) { double(:station) }
  let(:end_station) { double(:station) }
  subject(:journey) { described_class.new entry_station }

    context "no entry station passed" do
      subject(:journey) { described_class.new }
      it 'is incomplete' do
        expect(journey).not_to be_complete
      end
    end

    context "entry station passed" do
      it 'is incomplete' do
        expect(journey).not_to be_complete
      end
    end

    describe "#end" do
      it "completes the journey" do
        journey.end end_station
        expect(journey).to be_complete
      end
    end


  describe "#fare" do
    context "for an incomplete a journey" do
      it "charges a penalty fare" do
        allow(subject).to receive(:complete?).and_return false
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end
    context "for a complete journey" do
      it "charges the minimum fare" do
        allow(subject).to receive(:complete?).and_return true
        expect(subject.fare).to eq Journey::MIN_FARE
      end
    end
  end


end
