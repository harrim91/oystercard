class Oystercard
	MAX_BALANCE = 90
  MIN_FARE = 1
	attr_reader :balance, :journey_log

	def initialize
		@balance = 0
    @journey_log = []
	end

	def top_up(amount)
		fail "Can't top up over £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
		@balance += amount
	end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MIN_FARE
    @journey_log << Journey.new
    last_journey.start(station)
  end

  def touch_out(station)
    last_journey.end(station)
    deduct_fare
  end

  def in_journey?
    !(last_journey.complete?)
  end

private

  def deduct_fare
    @balance -= MIN_FARE
  end

  def last_journey
    @journey_log.last
  end

end