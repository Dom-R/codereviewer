# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Identificator::PullRequestRequest do
  subject { described_class.new({}) }

  describe '#process' do
    it 'returns 200' do
      expect(subject.process).to eq 200
    end
  end
end
