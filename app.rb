# frozen_string_literal: true

require 'sinatra'
require 'dotenv/load'
require 'pry-byebug' unless settings.production?
require_relative 'lib/identificator'

post '/' do
  event = Identificator.identify(request)
  event.process
end
