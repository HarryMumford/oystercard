class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def enter(station)
    @entry_station = station
  end

  def exit(station)
    @exit_station = station
  end

  def complete?
    !entry_station.nil? && !exit_station.nil?
  end
  
  def fare(fare = MINIMUM_FARE)
    complete? ? fare : 6
  end

end
