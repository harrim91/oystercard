require 'journey2'
require 'station'

describe Journey2 do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  subject(:journey) { described_class.new }

  describe "#initialize" do
    context "with no station passed" do
      it "is not complete" do
        expect(journey).not_to be_complete
      end
    end
    context "with a station passed" do
      subject(:journey) {described_class.new entry_station}
      it "is not complete" do
        expect(journey).not_to be_complete
      end
    end
  end

  describe "#end" do
    it "completes the journey" do
      journey.end(exit_station)
      expect(journey).to be_complete
    end
  end

  describe "#fare" do
    it "returns the minimum fare for complete journeys" do
      allow(journey).to receive(:complete?) { true }
      expect(journey.fare).to eq Journey2::MIN_FARE
    end
    it "returns the penalty fare for incomplete journeys" do
      allow(journey).to receive(:complete?) { false }
      expect(journey.fare).to eq Journey2::PENALTY_FARE
    end
  end
end