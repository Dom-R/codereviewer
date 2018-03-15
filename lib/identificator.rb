# frozen_string_literal: true

require 'json'

require_relative 'identificator/unknown_request'
require_relative 'identificator/pull_request_request'

class Identificator
  def self.identify(request)
    return UnknownRequest.new unless request.env['HTTP_X_GITHUB_EVENT'] == 'pull_request'

    body = JSON.parse(request.body.read)

    PullRequestRequest.new(body)
  end
end
