require 'spec_helper'

RSpec.describe Identificator do
  describe '#identify' do
    subject { described_class.identify(request) }

    context 'a unknown request' do
      let(:request) { Sinatra::Request.new(nil) }

      it 'returns an object that responds to process' do
        expect(subject).to respond_to(:process)
      end
    end
  end
end
