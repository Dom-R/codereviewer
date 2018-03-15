# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'App' do
  describe 'received post at' do
    describe '/' do
      let(:parameters) { {} }
      let(:enviroments) { {} }

      subject do
        post '/', params = parameters, rack_env = enviroments
      end

      it 'calls Identificator.identify' do
        expect(Identificator).to receive(:identify)

        post '/'
      end

      context 'pull request request' do
        let(:body) do
          StringIO.new(
            {
              "pull_request": {
                "comments_url": 'https://api.github.com/repos/Test/test/issues/1/comments'
              }
            }.to_json
          )
        end

        let(:enviroments) do
          {
            'HTTP_X_GITHUB_EVENT' => 'pull_request',
            'rack.input' => body
          }
        end

        it 'responds ok' do
          subject

          expect(last_response).to be_ok
        end
      end

      context 'other requests' do
        let(:enviroments) { { 'SOME_RANDOM_HEADER' => 'something unecessary' } }

        it 'responds 412' do
          subject

          expect(last_response).not_to be_ok
        end
      end
    end
  end
end
