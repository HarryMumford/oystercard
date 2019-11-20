class Journey

  def entry(station)
    @in = station
  end
  
  def exit(station)
    @out = station
  end

  def complete?
    @in.exists? && @out.exists?
  end
end
