require 'from_json'

class Food
  extend FromJson

  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def empty?
    true
  end
end
