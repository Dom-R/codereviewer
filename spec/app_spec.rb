# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'App' do
  describe 'received post at' do
    describe '/' do
      it 'does not responds ok' do
        post '/'

        expect(last_response).not_to be_ok
      end

      it 'calls Identificator.identify' do
        expect(Identificator).to receive(:identify)

        post '/'
      end
    end
  end
end
