class Segment
  attr_reader :x, :y, :life

  def initialize(x:, y:, life: 0)
    @x = x
    @y = y
    @life = life
  end

  def to_a
    [x, y]
  end
end
