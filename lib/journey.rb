class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize entry_station=nil
    @entry_station = entry_station
  end

  def end end_station
    @end_station = end_station
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    !!@end_station
  end

end