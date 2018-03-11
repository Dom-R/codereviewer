# frozen_string_literal: true

class Identificator
  class PullRequestRequest
    attr_reader :request_body

    def initialize(request_body)
      @request_body = request_body
    end

    def process
      comment
      200
    end

    private

    def comment
      url = (request_body['pull_request']['comments_url']).to_s
      body = { body: 'This is a default comment' }
    end
  end
end
