require 'journey'

describe Journey do

  let(:aldgate_station) { double("entry station", name: :aldgate, zone: 1) }
  let(:bank_station) { double("exit station", name: :bank, zone: 2) }
  journey = Journey.new

  describe "#complete?" do
    it "returns true if the journey is complete" do
      expect(journey.complete?).to eq true
    end
  end


  # it "" do
  #   expect(journey[entry_station]).to eq :bank
  # end

  # it "" do
  #
  # end
end
