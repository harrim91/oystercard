class JourneyLog

  def initialize
    @journeys = []
  end

  def journeys
    @journeys.clone
  end

  def start station
    @journeys << Journey.new
    current_journey.start(station)
  end

  private

  def current_journey
    @journeys.last
  end
end


