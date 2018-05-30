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
      if request_body["action"] == "opened"
        assign
        comment
      end

      200
    end

    private

    def comment
      github_client.post(comments_url, comment_body)
    end

    def comments_url
      request_body["pull_request"]["comments_url"]
    end

    def comment_body
      {
        body: "Reviewer: @#{reviewer}"
      }
    end

    def assign
      github_client.post(assign_url, assign_body)
    end

    def assign_url
      "#{request_body["pull_request"]["url"]}/requested_reviewers"
    end

    def assign_body
      {
        reviewers: [reviewer]
      }
    end

    def reviewer
      @reviewer ||= Settings.collaborators.sample
    end
  end
end
