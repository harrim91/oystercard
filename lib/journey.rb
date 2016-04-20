class Journey
  attr_reader :entry_station, :exit_station, :journey_log

def initialize
  @entry_station = nil
  @exit_station = nil
  @journey_log = {}
end

def start_journey(station, card)
  fail "Insufficient funds." if insufficient_funds?(card)
  @entry_station = station
end

def end_journey(station, card)
  @exit_station = station
  @journey_log[@entry_station] = @exit_station
  @entry_station = nil
end

def in_journey?
  !!@entry_station
end

def fare
  Oystercard::MIN_FARE
end

private

def insufficient_funds?(card)
  card.balance < Oystercard::MIN_FARE
end

end