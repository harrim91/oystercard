class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize entry_station=nil
    @journey_log = {:start => entry_station }
  end

  def end end_station
    @journey_log[:end] = end_station
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    @journey_log.has_key?(:end)
  end

end