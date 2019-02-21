$LOAD_PATH << File.expand_path('lib', __dir__)

require 'sinatra'
require 'json'
require 'board'
require 'hero'
require 'brain'

def json(plain)
  plain ? JSON.parse(plain).transform_keys(&:to_sym) : {}
end

get '/' do
  'Battlesnake documentation can be found at' \
    '<a href="https://docs.battlesnake.io">https://docs.battlesnake.io</a>.'
end

post '/start' do
  request_json = json(request.body.read)
  puts request_json.inspect

  hero = Hero.from_json(request_json[:you])

  hero.configuration.to_json
end

post '/move' do
  request_json = json(request.body.read)
  board = Board.from_json(request_json[:board])
  hero = Hero.from_json(request_json[:you])
  brain = Brain.new(board: board, snake: hero)

  move = brain.move

  # Example response
  response_object = {
    move: move.to_s,
  }

  response_object.to_json
end

post '/end' do
  request_json = json(request.body.read)

  # No response required
  response_object = {}

  response_object.to_json
end

post '/ping' do
  200
end
