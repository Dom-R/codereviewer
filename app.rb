require 'sinatra'
require 'pry-byebug' unless production?
require_relative 'lib/identificator'

post '/webhooks' do
  Identificator.identify(request)
end
