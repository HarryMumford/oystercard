require "journey_log"

describe JourneyLog do
  let(:algate_station) { double("entry station", name: :algate, zone: 1) }
  let(:bank_station) { double("exit station", name: :bank, zone: 2) }
  let(:journey) { double("new journey", entry_station: aldgate_station, exit_station: bank_station) }

  describe "#start" do
    it "starts new journey with entry station" do
      expect(journey).to receive(:enter).with(aldgate_station)
    end
  end 
end