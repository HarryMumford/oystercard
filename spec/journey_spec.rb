require 'journey'

describe Journey do

  let(:aldgate_station) { double("entry station", name: :aldgate, zone: 1) }
  let(:bank_station) { double("exit station", name: :bank, zone: 2) }

  it 'knows its entry station' do
    subject.enter(aldgate_station)                    
    expect(subject.entry_station).to eq(aldgate_station)              
  end          
  
  it 'knows its entry station' do   
    subject.exit(bank_station)                  
    expect(subject.exit_station).to eq(bank_station)              
  end      

  context "journey has been completed" do
    describe "#complete?" do
      it "returns true if the journey is complete" do
        subject.enter(aldgate_station)
        subject.exit(bank_station) 
        expect(subject.complete?).to eq true
      end
    end
  
  end

<<<<<<< HEAD

  describe "#fare" do
    it "has a minimum fare of one pound" do
      journey.entry(:aldgate_station)
      journey.exit(:bank_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end
  # context "journey has not been completed" do
  #   describe "#complete?" do
  #     it "returns false if the journey is  not complete" do
  #       expect(journey.complete?).to eq false
  #     end
  #   end
  # end
=======
  context "journey has not been completed" do
    describe "#complete?" do
      it "returns false if no entry station" do
        subject.exit(bank_station) 
        expect(subject.complete?).to eq false
      end

      it "returns false if no exit station" do
        subject.enter(aldgate_station) 
        expect(subject.complete?).to eq false
      end

      # it "returns false if no exit or entry" do 
      #   expect(subject.complete?).to eq false
      # end
    end
  end

  describe "#fare" do
    it "should return the min amount with a valid journey" do
      subject.enter(aldgate_station) 
      subject.exit(bank_station) 
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it "should return a penalty fare if no exit station" do
      subject.enter(aldgate_station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it "should return a penalty fare if no entry station " do
      subject.exit(bank_station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
>>>>>>> testing_branch
end
