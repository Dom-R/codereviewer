# frozen_string_literal: true

require 'sinatra'
require 'dotenv'
require 'pry-byebug' unless settings.production?
require_relative 'lib/identificator'

Dotenv.load(
  ".env.#{ENV['RACK_ENV']}",
  '.env.sample',
  '.env'
)

post '/' do
  event = Identificator.identify(request)
  event.process
end
