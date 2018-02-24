require 'spec_helper'

describe "App" do
  describe 'get' do
    describe '/' do
      it 'responds ok' do
        get '/'

        expect(last_response).to be_ok
      end

      it 'says hello world' do
        get '/'

        expect(last_response.body).to eq 'Hello world!'
      end
    end
  end

  describe 'post' do
    describe '/webhooks' do
      it 'responds ok' do
        post '/webhooks'

        expect(last_response).to be_ok
      end
    end
  end
end
