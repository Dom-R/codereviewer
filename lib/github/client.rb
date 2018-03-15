# frozen_string_literal: true

require 'base64'
require 'net/http'
require 'json'

module Github
  class Client
    def post(url, body)
      authorization = Base64.strict_encode64("#{ENV['GITHUB_USERNAME']}:#{ENV['GITHUB_TOKEN']}")
      header = { 'Authorization' => "Basic #{authorization}",
                 'Content-Type' => 'application/json' }

      uri = URI(url)
      Net::HTTP.post(uri, body.to_json, header)
    end
  end
end
