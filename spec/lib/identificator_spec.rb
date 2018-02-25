require 'spec_helper'

describe Identificator do
  describe '#identify' do
    let(:request) { spy }

    subject { described_class.identify(request) }

    it 'returns a UnknownRequest' do
      expect(subject).to eq described_class::UnknownRequest
    end
  end
end
