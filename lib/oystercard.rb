class Oystercard

  INITIAL_BALANCE = 0
  MAX_BALANCE = 90
  MAX_BAL_ERR = "Maximum balance is £#{MAX_BALANCE}"
  MIN_BAL_ERR = "Minimum balance is £#{Journey::MIN_FARE}"

  attr_reader :balance

  def initialize journey_log = JourneyLog
    @balance = INITIAL_BALANCE
    @journey_log = []
  end

  def top_up amount
    raise MAX_BAL_ERR if top_up_too_large? amount
    @balance += amount
  end

  def touch_in entry_station
    raise MIN_BAL_ERR if insufficient_funds?
    deduct current_journey.fare unless current_journey_complete?
    @journey_log << Journey.new(entry_station)
  end

  def touch_out exit_station
    if current_journey_complete?
      @journey_log << Journey.new
      deduct current_journey.fare
      current_journey.end exit_station
    else
      current_journey.end exit_station
      deduct current_journey.fare
    end
  end

  def current_journey_complete?
    journey_log.empty? || current_journey.complete?
  end

  def journey_log
    @journey_log.clone
  end

  private
  def top_up_too_large? amount
    (balance + amount) > MAX_BALANCE
  end

  def insufficient_funds?
    balance < Journey::MIN_FARE
  end

  def deduct amount
    @balance -= amount
  end

  def current_journey
    @journey_log.last
  end

end