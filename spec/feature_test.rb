require './lib/oystercard.rb'
card = Oystercard.new 
card.top_up(50)
card.touch_in
card.touch_out
card.list_journeys
=> [entry_station.name]