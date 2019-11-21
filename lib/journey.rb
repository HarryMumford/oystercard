class Journey
  attr_reader :entry_station, :exit_station

  def enter(station)
    @entry_station = station
  end

  def exit(station)
    @exit_station = station
  end

  def complete?
    !entry_station.nil? && !exit_station.nil?
  end
  
end
