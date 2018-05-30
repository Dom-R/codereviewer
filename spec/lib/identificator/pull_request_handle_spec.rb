# frozen_string_literal: true

require "spec_helper"

RSpec.describe Identificator::PullRequestHandle do
  let(:request) do
    {
      "pull_request" => {
        "comments_url" => "https://api.github.com/repos/Test/test/issues/1/comments"
      }
    }
  end

  subject { described_class.new(request) }

  describe "#process" do
    let!(:github_client) { instance_double("Github::Client") }
    let!(:url) { "https://api.github.com/repos/Test/test/issues/1/comments" }
    let!(:body) do
      {
        body: "This is a default comment"
      }
    end

    before do
      allow(Github::Client).to receive(:new).and_return(github_client)
    end

    it "post a comment" do
      expect(github_client).to receive(:post).with(url, body)

      subject.process
    end

    it "returns 200" do
      allow(github_client).to receive(:post).with(url, body)

      expect(subject.process).to eq 200
    end
  end
end
