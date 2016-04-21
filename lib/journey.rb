class Journey
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

end