require 'sinatra'
require 'pry-byebug' unless production?
require 'identificator'

get '/' do
  'Hello world!'
end

post '/webhooks' do
  Identificator.identify(request)
end
