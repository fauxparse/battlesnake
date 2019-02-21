require 'from_json'
require 'segment'

class Snake
  extend FromJson

  attr_reader :id, :name, :health, :body

  def initialize(id:, name:, health:, body:)
    @id = id
    @name = name
    @health = health
    @body = body.map.with_index do |segment, i|
      Segment.new(x: segment['x'], y: segment['y'], life: body.size - i)
    end
  end

  def head
    body.first
  end

  def x
    head.x
  end

  def y
    head.y
  end

  def includes?(x, y, offset = 0)
    body.any? do |segment|
      segment.x == x && segment.y == y && segment.life >= offset
    end
  end

  def empty?
    false
  end
end
