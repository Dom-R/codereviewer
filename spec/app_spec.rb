require 'spec_helper'

describe "App" do
  describe 'received post at' do
    describe '/webhooks' do
      it 'responds ok' do
        post '/webhooks'

        expect(last_response).to be_ok
      end

      it 'calls Identificator.identify' do
        expect(Identificator).to receive(:identify)

        post '/webhooks'
      end
    end
  end
end
