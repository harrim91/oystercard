require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  it {is_expected.to respond_to(:start, :end).with(1).argument}

  describe "#initialize" do
    it "has no start point" do
      expect(journey.get_start).to be_nil
    end
    it "has no end point" do
      expect(journey.get_end).to be_nil
    end
  end

  describe "#start" do
    it "sets the start point" do
      journey.start(entry_station)
      expect(journey.get_start).to eq entry_station
    end
  end

  describe "#end" do
    it "sets the end point" do
      journey.end(exit_station)
      expect(journey.get_end).to eq exit_station
    end
  end

  describe "#complete?" do
    context "journey is empty" do
      it "returns true" do
        expect(journey.complete?).to eq true
      end
    end
    context "journey has a start but no end" do
      before {journey.start(entry_station)}
      it "returns false" do
        expect(journey.complete?).to eq false
      end
    end
    context "journey has an end but no start" do
      before {journey.end(exit_station)}
      it "returns false" do
        expect(journey.complete?).to eq false
      end
    end
    context "journey has start and end" do
      before {journey.start(entry_station) ; journey.end(exit_station)}
      it "returns true" do
        expect(journey.complete?).to eq true
      end
    end
  end

  describe "#fare" do
    it "returns the minimum fare for complete journeys" do
      allow(journey).to receive(:complete?) { true }
      expect(journey.fare).to eq Journey::MIN_FARE
    end
    it "returns the penalty fare for incomplete journeys" do
      allow(journey).to receive(:complete?) { false }
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end