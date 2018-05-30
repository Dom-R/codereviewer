# frozen_string_literal: true

require "spec_helper"

RSpec.describe Settings do
  describe ".collaborators" do
    it "returns a list of collaborators" do
      expect(described_class.collaborators).to eq ["Waldo", "Wenda", "Odlaw", "Wilma"]
    end
  end
end
