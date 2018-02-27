require 'spec_helper'

RSpec.describe 'App' do
  describe 'received post at' do
    describe '/' do
      it 'responds ok' do
        post '/'

        expect(last_response).to be_ok
      end

      it 'calls Identificator.identify' do
        expect(Identificator).to receive(:identify)

        post '/'
      end
    end
  end
end
