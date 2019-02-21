require 'move'

class Brain
  attr_reader :board, :snake

  def initialize(board:, snake:)
    @board = board
    @snake = snake
  end

  def move
    possibles = Move.possible(snake, board)
    possibles.detect(&:food?) ||
      possibles.sample ||
      Move.random(snake, board)
  end
end
