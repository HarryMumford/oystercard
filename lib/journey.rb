class Journey

MINIMUM_FARE = 1

  def entry(station)
    @in = station
  end

  def exit(station)
    @out = station
  end

  def complete?
    !@in.empty? && !@out.empty?
  end

  def fare
    return MINIMUM_FARE
  end
end
