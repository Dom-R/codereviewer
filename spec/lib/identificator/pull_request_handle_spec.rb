# frozen_string_literal: true

require "spec_helper"

RSpec.describe Identificator::PullRequestHandle do
  let(:github_client) { instance_double("Github::Client") }
  let(:comments_url) { "https://api.github.com/repos/Test/test/issues/1/comments" }
  let(:comment_body) do
    {
      body: "Reviewer: @Wenda"
    }
  end
  let(:assign_url) { "https://api.github.com/repos/Test/test/pulls/1/requested_reviewers" }
  let(:assign_body) do
    {
      reviewers: ["Wenda"]
    }
  end
  let(:request) do
    {
      "pull_request" => {
        "url" => "https://api.github.com/repos/Test/test/pulls/1",
        "comments_url" => comments_url
      }
    }
  end

  subject { described_class.new(request) }

  describe "#process" do
    context "with a pull request being opened" do
      let(:opened_request) { request.merge("action" => "opened") }

      subject { described_class.new(opened_request) }

      before do
        allow(Github::Client).to receive(:new).and_return(github_client)
      end

      it "comment and assign a reviewer" do
        expect(github_client).to receive(:post).with(comments_url, comment_body)
        expect(github_client).to receive(:post).with(assign_url, assign_body)

        subject.process
      end

      it "returns 200" do
        allow(github_client).to receive(:post).with(comments_url, comment_body)
        allow(github_client).to receive(:post).with(assign_url, assign_body)

        expect(subject.process).to eq 200
      end
    end

    context "with any other type of pull request" do
      it "does not comment and assign a reviewer" do
        expect(github_client).to_not receive(:post).with(comments_url, comment_body)
        expect(github_client).to_not receive(:post).with(assign_url, assign_body)

        subject.process
      end

      it "returns 200" do
        expect(subject.process).to eq 200
      end
    end
  end
end
