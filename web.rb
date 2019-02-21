require 'sinatra'
require 'json'

get '/' do
  'Battlesnake documentation can be found at' \
    '<a href="https://docs.battlesnake.io">https://docs.battlesnake.io</a>.'
end

post '/start' do
  request_body = request.body.read
  request_json = request_body ? JSON.parse(request_body) : {}

  # Example response
  response_object = {
    color: '#fff000',
  }

  response_object.to_json
end

post '/move' do
  request_body = request.body.read
  request_json = request_body ? JSON.parse(request_body) : {}

  # Calculate a direction (example)
  direction = %w[up right].sample

  # Example response
  response_object = {
    move: direction,
  }

  response_object.to_json
end

post '/end' do
  request_body = request.body.read
  request_json = request_body ? JSON.parse(request_body) : {}

  # No response required
  response_object = {}

  response_object.to_json
end

post '/ping' do
  200
end
