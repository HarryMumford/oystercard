class Oystercard
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def top_up(amount)
    "card was topped up by £#{amount}"
  end
end