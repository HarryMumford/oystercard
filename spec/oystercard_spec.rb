require 'oystercard'

RSpec.describe Oystercard do
  let(:test_oystercard) { Oystercard.new }
  let(:algate_station) { double(:station, name: :algate, zone: 1) }
  let(:bank_station) { double(:station, name: :bank, zone: 2) }
  
  before(:each) do
    test_oystercard.top_up(10)
  end

  context 'balance' do
    it 'has a default balance of £0' do
      expect(subject.balance).to be 0
    end

    it 'has a maximum limit' do
      expect(subject.limit).to be Oystercard::MAXIMUM_LIMIT
    end

    describe '#top_up' do
      it 'returns balance after topping up specified amount' do
        amount = 5
        expect(subject.top_up(amount)).to eq("card was topped up by £#{amount} and the current balance is £#{subject.balance}")
      end

      it 'increases the card balance by the specified amount' do
        expect { subject.top_up(10) }.to change { subject.balance }.by 10
      end

      it 'should not allow a user to exceed the limit' do
        almost_full_oyster = Oystercard.new
        almost_full_oyster.top_up(Oystercard::MAXIMUM_LIMIT - 3)
        expect { almost_full_oyster.top_up(5) }.to raise_error Oystercard::CANNOT_EXCEED_MAXIMUM_LIMIT
      end
    end
  end



  describe '#deduct' do
    let(:amount) { 5 }
  end

  context 'when on a journey' do
    describe '#touch_in' do
      it 'should register when in use' do
        test_oystercard.touch_in(algate_station)
        expect(test_oystercard.in_journey?).to be true
      end

      it "raise error when touching in with balance below £1" do
        expect{subject.touch_in(algate_station)}.to raise_error(Oystercard::INSUFFICIENT_FUNDS)
      end
    end   
  
    describe '#touch_out' do
      it 'should not be in use once a journey is completed' do
        test_oystercard.touch_in(algate_station)
        test_oystercard.touch_out(bank_station)
        expect(test_oystercard.in_journey?).to be false
      end

      it 'should charge the card for the minumum fare' do
        test_oystercard.touch_in(algate_station)
        expect { test_oystercard.touch_out(bank_station) }.to change { test_oystercard.balance }.by (-Oystercard::MINIMUM_AMOUNT_FOR_JOURNEY)
     end
    end
  end
  
  describe "journey history" do 
    
    it "should save a list of journeys"do
      test_oystercard.top_up(50)
      test_oystercard.touch_in(algate_station)
      test_oystercard.touch_out(bank_station)
      expect(test_oystercard.list_journeys).to eq([{:entry_station=>:algate, :entry_zone=>1, :exit_station=>:bank, :exit_zone=>2}])
    end
    
    it "should have a list of journeys empty as default" do
      expect(test_oystercard.list_journeys.empty?).to eq true
    end
  end
end


