# frozen_string_literal: true

require 'json'

require_relative 'identificator/unknown_request'
require_relative 'identificator/pull_request_handle'

class Identificator
  def self.identify(request)
    return UnknownRequest.new unless request.env['HTTP_X_GITHUB_EVENT'] == 'pull_request'

    body = JSON.parse(request.body.read)

    PullRequestHandle.new(body)
  end
end
