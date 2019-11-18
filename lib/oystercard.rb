class Oystercard
  attr_reader :balance, :limit, :in_journey
  
  MAXIMUM_LIMIT = 90
  CANNOT_EXCEED_MAXIMUM_LIMIT = "operation denied: this transaction will exceed the £#{MAXIMUM_LIMIT} limit"
  
  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
    @in_journey = false
  end

  def top_up(amount)
    raise CANNOT_EXCEED_MAXIMUM_LIMIT unless balance + amount <= MAXIMUM_LIMIT

    @balance += amount
    "card was topped up by £#{amount}"
  end

  def deduct(amount)
    @balance -= amount
    "beep"
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    in_journey
  end
end