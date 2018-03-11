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

    context 'a pull request request' do
      let(:body) do
        StringIO.new(
          {
            "pull_request": {
              "comments_url": 'https://api.github.com/repos/Test/test/issues/1/comments'
            }
          }.to_json
        )
      end

      let(:request) do
        Sinatra::Request.new(
          'HTTP_X_GITHUB_EVENT' => 'pull_request',
          'rack.input' => body
        )
      end

      it 'returns an object that responds to process' do
        expect(subject).to respond_to(:process)
      end

      it 'returns an object of kind PullRequest' do
        expect(subject).to be_a(Identificator::PullRequestRequest)
      end
    end
  end
end
