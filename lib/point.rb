class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def angle_with_origin
    Math.atan2(@y, @x)
  end

  def distance_to(other_point)
    Math.hypot(@x - other_point.x, @y - other_point.y)
  end

  def orientation(p1, p2)
    val = (p2.y - p1.y) * (@x - p2.x) - (p2.x - p1.x) * (@y - p2.y)
    return 0 if val == 0
    val.positive? ? 1 : 2
  end
end
