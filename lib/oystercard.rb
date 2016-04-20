require 'journey'

class Oystercard

  INITIAL_BALANCE = 0
  MIN_FARE = 1
  MAX_BALANCE = 90
  PENALTY_FARE = 6
  MAX_BAL_ERR = "Maximum balance is £#{MAX_BALANCE}"
  MIN_BAL_ERR = "Minimum balance is £#{MIN_FARE}"

  attr_reader :balance

  def initialize
    @balance = INITIAL_BALANCE
    @journey_history = []
  end

  def in_journey?
    journey_history.empty? ? false : last_journey.get_end.nil?
  end

  def top_up amount
    raise MAX_BAL_ERR if top_up_too_large? amount
    @balance += amount
  end

  def touch_in entry_station
    raise MIN_BAL_ERR if insufficient_funds?
    #deduct(PENALTY_FARE) if in_journey?
    @journey_history << Journey.new
    last_journey.start entry_station
  end

  def touch_out exit_station
    deduct MIN_FARE
    last_journey.end(exit_station)
  end

  def journey_history
    @journey_history.clone
  end

  private
  def top_up_too_large? amount
    (balance + amount) > MAX_BALANCE
  end

  def insufficient_funds?
    balance < MIN_FARE
  end

  def deduct amount
    @balance -= amount
  end

  def last_journey
    @journey_history.last
  end

end
