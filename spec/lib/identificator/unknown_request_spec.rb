# frozen_string_literal: true

require "spec_helper"

RSpec.describe Identificator::UnknownRequest do
  subject { described_class.new }

  describe "#process" do
    it "returns 412" do
      expect(subject.process).to eq 412
    end
  end
end
