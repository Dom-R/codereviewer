# frozen_string_literal: true

require_relative '../github/client'

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
      url = (request_body['pull_request']['comments_url']).to_s
      body = { body: 'This is a default comment' }
      github_client.post(url, body)
    end
  end
end
