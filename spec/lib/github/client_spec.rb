# frozen_string_literal: true

require 'spec_helper'

describe Github::Client do
  describe '#post' do
    let!(:url) { 'https://api.github.com/url' }
    let!(:body) do
      {
        body: 'this is a body'
      }
    end
    let!(:header) do
      {
        'Authorization' => 'Basic VGVzdDp0ZXN0dG9rZW4=',
        'Content-Type' => 'application/json'
      }
    end

    it 'sends a post request' do
      expect(Net::HTTP).to receive(:post).with(
        URI('https://api.github.com/url'),
        body.to_json,
        header
      )

      subject.post(url, body)
    end
  end
end
