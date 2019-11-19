require './lib/oystercard.rb'
require './lib/station.rb'
card = Oystercard.new
entry_station = Station.new("algate")
exit_station = Station.new("bank")
exit_station.name
card.top_up(50)
card.touch_in(entry_station)
card.touch_out(exit_station)
card.list_journeys
