class Oystercard
  attr_reader :balance, :limit, :in_journey, :entry_station, :exit_station, :list_journeys
  
  MAXIMUM_LIMIT = 90
  MINIMUM_AMOUNT_FOR_JOURNEY = 1
  CANNOT_EXCEED_MAXIMUM_LIMIT = "operation denied: this transaction will exceed the £#{MAXIMUM_LIMIT} limit"
  INSUFFICIENT_FUNDS = "operation denied: card must have #{MINIMUM_AMOUNT_FOR_JOURNEY} to travel"

  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
    @in_journey = false
    @entry_station
  end

  def top_up(amount)
    raise CANNOT_EXCEED_MAXIMUM_LIMIT unless balance + amount <= MAXIMUM_LIMIT

    @balance += amount
    "card was topped up by £#{amount} and the current balance is £#{balance}"
  end

  def touch_in(station)
    raise INSUFFICIENT_FUNDS unless balance >= MINIMUM_AMOUNT_FOR_JOURNEY
    @entry_station = station.name
    @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_AMOUNT_FOR_JOURNEY)
    @entry_station = nil
    @in_journey = false
    @exit_station = station.name
  end

  def in_journey?
    in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
    "beep"
  end

end