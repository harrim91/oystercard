class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1


  def initialize
    @journey_log = {}
  end

  def get_start
    @journey_log[:start]
  end

  def get_end
    @journey_log[:end]
  end

  def start entry_station
    @journey_log[:start] = entry_station
  end

  def end end_station
    @journey_log[:end] = end_station
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    @journey_log.keys.length.even?
  end

end
