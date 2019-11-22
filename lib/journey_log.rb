class JourneyLog

  attr_reader :log, :journey

  def initialize(journey = Journey)
    @journey = journey.new
    @log = []
  end

  def start(station)
    journey.enter(station)
  end

  def finish(station)
    journey.exit(station)
    log << journey
    journey = nil
  end

  private

  def current_journey
    journey
  end
end