class JourneyLog
  def initialize journey_class = Journey
    @journey_class = journey_class
    @journeys = []
  end

  def start entry_station=nil
    @current_journey = @journey_class.new(entry_station)
  end

  def finish exit_station
    current_journey.end exit_station
    @journeys << @current_journey
    @current_journey = nil
  end

  def journeys
    @journeys.clone
  end

  private
  def current_journey
    @current_journey.nil? ? self.start : @current_journey
  end
end