require './lib/station.rb'
class Journey2
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize station=Station.new("N/A", 0)
    @journey = {:start => station}
  end

  def end(station)
    @journey[:end] = station
  end

  def complete?
    @journey.keys.length == 2
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end

# station = Station.new ("Aldgate", 2)
# journey = Journey.new(station)
#   #@journey == { :start => ["Aldgate", 2] }

# journey2 = Journey.new
#   # @journey = { :start => ['N/A', 0]}