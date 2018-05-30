# frozen_string_literal: true

require_relative "../github/client"

class Identificator
  class PullRequestHandle
    attr_reader :request_body, :github_client

    def initialize(request_body)
      @request_body = request_body
      @github_client = ::Github::Client.new
    end

    def process
      choose_and_comment_reviewer if request_body["action"] == "opened"
      200
    end

    private

    def choose_and_comment_reviewer
      github_client.post(url, body)
    end

    def url
      request_body["pull_request"]["comments_url"]
    end

    def body
      {
        body: "Reviewer: @#{reviewer}"
      }
    end

    def reviewer
      Settings.collaborators.sample
    end
  end
end
