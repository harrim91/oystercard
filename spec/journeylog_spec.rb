require "journeylog"

describe JourneyLog do
  let(:entry_station) { double :station }
  subject(:journey_log) { described_class.new }

  describe "#initialize" do
    it "is empty" do
      expect(journey_log.journeys).to be_empty
    end
  end

  describe "#start" do
    it "starts a new journey" do
      journey_log.start(entry_station)
      expect(journey_log.journeys).not_to be_empty
    end
  end

  # describe "#finish" do
  #   it ""
  # end
end

#starting a journey
#ending a journey
#returning a list of journeys