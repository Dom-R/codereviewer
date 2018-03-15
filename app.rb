# frozen_string_literal: true

require 'sinatra'
require 'pry-byebug' unless production?
require_relative 'lib/identificator'

post '/' do
  event = Identificator.identify(request)
  event.process
end
