class JarvisAlrotithm
  def jarvis(points)
    p0 = points.min_by { |p| [p.x, p.y] }
    hull = [p0]
    loop do
      t = points[0]
      points.each do |p|
        if (p - p0).cross(t - p0) > 0
          t = p
        end
      end
      if t == p0
        break
      else
        p0 = t
        hull.push(t)
      end
    end
    hull
  end
  
end
