require 'oystercard'

RSpec.describe Oystercard do
  context 'balance' do
    it 'has a default balance of £0' do
      expect(subject.balance).to be 0
    end
  end

  describe '#top_up' do
    it "returns balance after topping up specified amount" do
      amount = 5
      expect(subject.top_up(amount)).to eq("card was topped up by £#{amount}")
    end
  end
end
