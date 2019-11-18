require 'oystercard'

RSpec.describe Oystercard do
  context 'balance' do
    it 'has a default balance of £0' do
      expect(subject.balance).to be 0
    end
  end
end
