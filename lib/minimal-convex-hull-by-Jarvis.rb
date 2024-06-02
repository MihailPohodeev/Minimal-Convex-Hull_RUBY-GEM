require "point"

class JarvisAlrotithm
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
    for i in 1...n
      if points[p[i]].x < points[p[0]].x
        p[i], p[0] = p[0], p[i]
      end
    end

    h = [p[0]]
    p.delete_at(0)
    p.push(h[0])

    loop do
      right = 0
      for i in 1...p.length
        if rotate(points[h[-1]], points[p[right]], points[p[i]]) < 0
          right = i
        end
      end
      if p[right] == h[0]
        break
      else
        h.push(p[right])
        p.delete_at(right)
      end
    end
    result = []
    for i in 0..h.length-1
      if not result.include? points[h[i]]
        result << points[h[i]]
      end
    end
    return result
  end  
end
