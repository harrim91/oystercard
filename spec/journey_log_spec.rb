require 'journey_log'

describe JourneyLog do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { double(:journey, end: exit_station) }
  let(:journey_class) { double(:journey_class, new: journey) }
  subject(:journey_log) { described_class.new journey_class }

  describe "#initialize" do
    subject(:journey_log) { described_class }
    it "is initialized with a journey_class parameter" do
      expect(journey_log.new journey_class).to be_a described_class
    end
    it "has an optional initialize parameter" do
      expect(journey_log.new).to be_a described_class
    end
  end

  describe "#start" do
    it "should start a new journey with an entry station" do
      expect(journey_class).to receive(:new)
      journey_log.start entry_station
    end
  end

  describe "#finish" do
    it "should complete the current journey" do
      expect(journey).to receive(:end).with(exit_station)
      journey_log.finish exit_station
    end
  end

  describe "#journeys" do
    context "initialize" do
      it "returns the list of journeys" do
        expect(journey_log.journeys).to be_empty
      end
    end
    context "after a journey" do
      it "contains a journey" do
        journey_log.start entry_station
        journey_log.finish exit_station
        expect(journey_log.journeys).to include journey
      end
    end
  end
end