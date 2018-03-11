# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Identificator::PullRequestRequest do
  let(:request) do
    {
      'pull_request' => {
        'comments_url' => 'https://api.github.com/repos/Test/test/issues/1/comments'
      }
    }
  end

  subject { described_class.new(request) }

  describe '#process' do
    it 'returns 200' do
      expect(subject.process).to eq 200
    end
  end
end
