require 'journey'

describe Journey do

  let(:aldgate_station) { double("entry station", name: :aldgate, zone: 1) }
  let(:bank_station) { double("exit station", name: :bank, zone: 2) }
  journey = Journey.new

  context "journey has been completed" do
    #describe "#complete?" do
      it "returns true if the journey is complete" do
        expect(journey.complete?).to eq true
      end
    #end

    ##describe "#entry?" do 
      it "returns true if card has entry station" do
        expect(journey.entry?).to eq(true)
      end
    #end

    ##describe "#exit?" do 
      it "returns true if card has exit station" do
        expect(journey.exit("aldgate")).to eq "aldgate"
      end
    #end
  end

  # context "journey has not been completed" do
  #   describe "#complete?" do
  #     it "returns false if the journey is  not complete" do
  #       expect(journey.complete?).to eq false
  #     end
  #   end
  # end
end
