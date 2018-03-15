# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Identificator do
  describe '#identify' do
    subject { described_class.identify(request) }

    context 'a unknown request' do
      let(:request) { Sinatra::Request.new({}) }

      it 'returns an object that responds to process' do
        expect(subject).to respond_to(:process)
      end

      it 'returns an object of kind UnknownRequest' do
        expect(subject).to be_a(Identificator::UnknownRequest)
      end
    end
  end
end
