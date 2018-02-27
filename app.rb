# frozen_string_literal: true

require 'sinatra'
require 'pry-byebug' unless production?
require_relative 'lib/identificator'

post '/' do
  Identificator.identify(request)
end
