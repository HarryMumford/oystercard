require 'oystercard'

RSpec.describe Oystercard do
  let(:test_oystercard) { Oystercard.new }

  context 'balance' do
    it 'has a default balance of £0' do
      expect(subject.balance).to be 0
    end

    it 'has a maximum limit' do
      expect(subject.limit).to be Oystercard::MAXIMUM_LIMIT
    end
  end

  describe '#top_up' do
    it "returns balance after topping up specified amount" do
      amount = 5
      expect(subject.top_up(amount)).to eq("card was topped up by £#{amount}")
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

  describe '#deduct' do
    let(:amount) { 5 }
    before(:each) do
      test_oystercard.top_up(10)
    end

    it "returns beep after deducting specified amount" do
      
      expect(subject.deduct(amount)).to eq("beep")
    end

    it 'decreases the card balance by the specified amount' do
      expect{test_oystercard.deduct(amount)}.to change { test_oystercard.balance }.by -amount
    end
  end

  context 'when on a journey' do
    it 'should register when in use' do
      test_oystercard.touch_in
      expect(test_oystercard.in_journey?).to be true
    end
    
    it 'should not be in use once a journey is completed' do
      test_oystercard.touch_in
      test_oystercard.touch_out
      expect(test_oystercard.in_journey?).to be false
    end
  end
end
