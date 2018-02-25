require 'sinatra'
require 'pry-byebug' unless production?
require_relative 'lib/identificator'

get '/' do
  'Hello world!'
end

post '/webhooks' do
  Identificator.identify(request)
end
