class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @journey = {}
  end

  def start(station)
    @journey[:start] = station
  end

  def end(station)
    @journey[:end] = station
  end

  def get_start
    @journey[:start]
  end

  def get_end
    @journey[:end]
  end

  def complete?
    @journey.keys.length.even?
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end