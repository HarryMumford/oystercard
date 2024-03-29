class Oystercard
  attr_reader :balance, :limit, :in_journey, :list_journeys, :journey
  
  MAXIMUM_LIMIT = 90
  MINIMUM_AMOUNT_FOR_JOURNEY = 1
  CANNOT_EXCEED_MAXIMUM_LIMIT = "operation denied: this transaction will exceed the £#{MAXIMUM_LIMIT} limit"
  INSUFFICIENT_FUNDS = "operation denied: card must have #{MINIMUM_AMOUNT_FOR_JOURNEY} to travel"

  def initialize
    @balance = 0
    @list_journeys = []
    @journey = {}
    # @journey_instance = Journey.new
  end

  def top_up(amount)
    raise CANNOT_EXCEED_MAXIMUM_LIMIT unless balance + amount <= MAXIMUM_LIMIT
    @balance += amount
    "card was topped up by £#{amount} and the current balance is £#{balance}"
  end

  def touch_in(station)
    raise INSUFFICIENT_FUNDS unless balance >= MINIMUM_AMOUNT_FOR_JOURNEY
    @journey_instance = Journey.new
    @journey[:entry_station] = station.name
    @journey[:entry_zone] = station.zone
    @in_journey = true
    @journey_instance.enter(station)
  end

  def touch_out(station)
    deduct(MINIMUM_AMOUNT_FOR_JOURNEY)
    @in_journey = false
    @journey[:exit_station] = station.name
    @journey[:exit_zone] = station.zone
    @list_journeys << journey
    @journey = {}
    @journey_instance.exit(station)
  end

  def valid_journey?
    @journey_instance.complete?
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
