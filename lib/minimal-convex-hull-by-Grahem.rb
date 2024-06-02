require "point"

class GrahemAlrotithm
private

  def self.rotate(a, b, c)
    return (b.x - a.x) * (c.y - b.y) - (b.y - a.y) * (c.x - b.x)
  end

public

  def self.convex_hull(points)
    n = points.length
    if n < 2
      return points.clone
    end
    p = (0...n).to_a
    for i in 0...n
      if points[p[i]].x < points[p[0]].x
        p[i], p[0] = p[0], p[i]
      end
    end
    
    for i in 2...n
      j = i
      while j>1 && (rotate(points[p[0]], points[p[j-1]], points[p[j]])<0) 
        p[j], p[j-1] = p[j-1], p[j]
        j -= 1
      end
    end
    
    s = [p[0], p[1]]
    for i in 2...n
      while rotate(points[s[-2]], points[s[-1]], points[p[i]]) < 0
        s.pop
      end
      s << p[i]
    end
    
    result = []
    for i in 0..s.length-1
      result << points[s[i]]
    end
    return result
  end
end
