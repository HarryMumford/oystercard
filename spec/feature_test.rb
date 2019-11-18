require './lib/oystercard.rb'
oystercard = Oystercard.new
=> #<Oystercard @balance=0, @limit=90, @in_use=false>
oystercard.top_up(20)
=> #<Oystercard @balance=20, @limit=90, @in_use=false>
oystercard.in_use
=> false
oystercard.touch_in
=> #<Oystercard @balance=20, @limit=90, @in_use=true>
oystercard.touch_out
=> #<Oystercard @balance=15, @limit=90, @in_use=false>