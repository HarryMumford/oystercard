require './lib/oystercard.rb'
require './lib/station.rb'
card = Oystercard.new
entry_station = Station.new("algate", 1)
exit_station = Station.new("bank", 2)
exit_station.name
card.top_up(50)
card.touch_in(entry_station)
card.touch_out(exit_station)
card.list_journeys
entry_station = Station.new("bank", 2)
exit_station = Station.new("mills", 3)
card.touch_in(entry_station)
card.touch_out(exit_station)
card.list_journeys


journey1 = Journey.new(entry = nil, exit = nil)


class Journey
  def initialize(entry, exit)
    #default is nil
    #touch in - touch out 
  end
end
