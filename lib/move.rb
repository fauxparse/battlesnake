require 'food'

class Move
  DIRECTIONS = {
    up: { x: 0, y: -1 },
    down: { x: 0, y: 1 },
    left: { x: -1, y: 0 },
    right: { x: 1, y: 0 },
  }.freeze

  attr_reader :direction, :x, :y, :contents

  def initialize(direction:, x:, y:, contents:)
    @direction = direction
    @x = x
    @y = y
    @contents = contents
  end

  def self.possible(snake, board, lookahead = 1)
    DIRECTIONS
      .keys
      .map { |direction| in_direction(direction, snake, board, lookahead) }
      .select(&:valid?)
  end

  def self.in_direction(direction, origin, board, lookahead = 1)
    delta = DIRECTIONS[direction]
    x = origin.x + delta[:x]
    y = origin.y + delta[:y]
    contents = board[x, y, lookahead]
    new(direction: direction, x: x, y: y, contents: contents)
  end

  def self.random(snake, board)
    in_direction(DIRECTIONS.keys.sample, snake, board)
  end

  def food?
    contents.is_a?(Food)
  end

  def valid?
    contents.empty?
  end

  def to_s
    direction.to_s
  end
end
