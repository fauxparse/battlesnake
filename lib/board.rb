require 'from_json'
require 'snake'
require 'food'
require 'wall'
require 'space'

class Board
  extend FromJson

  attr_reader :width, :height, :food, :snakes

  def initialize(width:, height:, food:, snakes:)
    @width = width
    @height = height
    @snakes = snakes.map { |json| Snake.from_json(json) }
    @food = food.map { |json| Food.from_json(json) }
  end

  def [](x, y, offset = 0)
    if (0...width).include?(x) && (0...height).include?(y)
      snake_at(x, y, offset) ||
        food_at(x, y, offset) ||
        Space.new
    else
      Wall.new
    end
  end

  private

  def snake_at(x, y, offset)
    snakes.detect { |snake| snake.includes?(x, y, offset) }
  end

  def food_at(x, y, _offset)
    food.detect { |apple| apple.x == x && apple.y == y }
  end
end
