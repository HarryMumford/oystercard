require "journey_log"

describe JourneyLog do
  describe "#start" do
    it "starts new journey with entry station" do
      expect(journey_class).to receive(:start).with(entry_station: station)
    end
  end 
end