# frozen_string_literal: true

require "spec_helper"

RSpec.describe Identificator::PullRequestHandle do
  let(:url) { "https://api.github.com/repos/Test/test/issues/1/comments" }
  let(:github_client) { instance_double("Github::Client") }

  subject { described_class.new(request) }

  describe "#process" do
    context "with a pull request being opened" do
      let(:request) do
        {
          "action" => "opened",
          "pull_request" => {
            "comments_url" => url
          }
        }
      end
      let(:body) do
        {
          body: "Reviewer: @Wenda"
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

    context "with any other type of pull request" do
      let(:request) do
        {
          "pull_request" => {
            "comments_url" => url
          }
        }
      end

      it "does not post a comment" do
        expect(github_client).to_not receive(:post)

        subject.process
      end

      it "returns 200" do
        expect(subject.process).to eq 200
      end
    end
  end
end
