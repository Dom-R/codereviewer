# frozen_string_literal: true

class Identificator
  class PullRequestRequest
    attr_reader :request_body

    def initialize(request_body)
      @request_body = request_body
    end

    def process
      200
    end
  end
end
