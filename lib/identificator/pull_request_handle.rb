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
      comment
      200
    end

    private

    def comment
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
