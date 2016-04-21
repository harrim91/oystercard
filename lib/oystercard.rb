class Oystercard
	MAX_BALANCE = 90
  MIN_FARE = 1
	attr_reader :balance, :max_balance, :entry_station, :exit_station, :journey_log

	def initialize(max_balance=MAX_BALANCE)
		@balance = 0
		@max_balance = max_balance
    @entry_station = nil
    @exit_station = nil
    @journey_log = []
	end

	def top_up(amount)
		fail "Can't top up over £#{max_balance}" if @balance + amount > max_balance
		@balance += amount
	end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MIN_FARE
    @entry_station = station
    @journey_log << {:start => station}
  end

  def touch_out(station)
    @exit_station = station
    deduct_fare
  end

private

  def deduct_fare
    @balance -= MIN_FARE
  end

end