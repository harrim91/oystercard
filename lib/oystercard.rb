class Oystercard

  INITIAL_BALANCE = 0
  MAX_BALANCE = 90
  MAX_BAL_ERR = "Maximum balance is £#{MAX_BALANCE}"
  MIN_BAL_ERR = "Minimum balance is £#{Journey::MIN_FARE}"

  attr_reader :balance

  def initialize journey_log = JourneyLog
    @balance = INITIAL_BALANCE
    @journey_log = journey_log.new
  end

  def top_up amount
    raise MAX_BAL_ERR if top_up_too_large? amount
    @balance += amount
  end

  def touch_in entry_station
    raise MIN_BAL_ERR if insufficient_funds?
    deduct current_journey.fare unless current_journey.complete?
    @journey_log.start entry_station
  end

  def touch_out exit_station
    if current_journey.complete?
      @journey_log.start
      deduct current_journey.fare
      @journey_log.finish exit_station
    else
      @journey_log.finish exit_station
      deduct current_journey.fare
    end
  end

  def journey_log
    @journey_log.journeys
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
    @journey_log.current_journey
  end

end