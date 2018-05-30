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
      comment if request_body["action"] == "opened"

      200
    end

    private

    def comment
      github_client.post(comment_url, comment_body)
    end

    def comment_url
      request_body["pull_request"]["comments_url"]
    end

    def comment_body
      {
        body: "Reviewer: @#{reviewer}"
      }
    end

    def reviewer
      @reviewer ||= Settings.collaborators.sample
    end
  end
end
