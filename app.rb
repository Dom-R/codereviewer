require 'sinatra'
require 'pry-byebug' unless production?

get '/' do
  'Hello world!'
end

get '/webhooks' do
  'webhooks...'
end
