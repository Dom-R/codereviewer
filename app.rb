require 'sinatra'
require 'pry-byebug' unless production?

get '/' do
  'Hello world!'
end

post '/webhooks' do; end
