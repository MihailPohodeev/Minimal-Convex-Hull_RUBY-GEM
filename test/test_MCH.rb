require "minitest/autorun"
require "minimal-convex-hull-by-Grahem"
require "minimal-convex-hull-by-Jarvis"
require "point"

Algorithms = [GrahemAlrotithm, JarvisAlrotithm]

class MCH_Test < Minitest::Test
  def test_0_1_points
    for i in 0..1
      # check empty array
      points = []
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
      
      # check 1 points
      points = [
        Point.new(1, 1),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(1, 1)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
    end
  end
  
  def test_2_points
    for i in 0..1
      # check 2 points (same)
      points = [
        Point.new(0, 0),
        Point.new(0, 0),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(0, 0)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
      
      # check 2 points (different)
      points = [
        Point.new(1, 1),
        Point.new(2, 2),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(1, 1), Point.new(2, 2)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
    end
  end

  def test_3_points
    for i in 0..1
      # check 3 points (triangle)
      points = [
        Point.new(0, 3),
        Point.new(0, 0),
        Point.new(3, 0),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(0, 3), Point.new(3, 0), Point.new(0, 0)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
      
      # check 3 point located on single line
      points = [
        Point.new(1, 1),
        Point.new(2, 2),
        Point.new(3, 3),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(3, 3), Point.new(1, 1), Point.new(2, 2)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
    end
  end

  def test_4_points
    for i in 0..1
      # check 4 points (square)
      points = [
        Point.new(0, 3),
        Point.new(0, 0),
        Point.new(3, 0),
        Point.new(3, 3)
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(3, 3), Point.new(0, 3), Point.new(3, 0), Point.new(0, 0)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
      
      # check 4 points where 1 point inside other's square
      points = [
        Point.new(0, 3),
        Point.new(0, 0),
        Point.new(3, 0),
        Point.new(0.5, 0.5)
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(0, 0), Point.new(3, 0), Point.new(0, 3)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
    end
  end

  def test_too_many_points
    for i in 0..1
      # check 4 points (square)
      points = [
        Point.new(0, 3),
        Point.new(1, 2),
        Point.new(2, 2),
        Point.new(-1.5, 1.5),
        Point.new(0, -1.6),
        Point.new(-1, 1),
        Point.new(1, 1),
        Point.new(2, 1),
        Point.new(0, 0),
        Point.new(3, 0),
        Point.new(0, -2),
        Point.new(1, -1),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(-1.5, 1.5), Point.new(0, 3), Point.new(2, 2), Point.new(3, 0), Point.new(0, -2)].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
      
      # check 4 points where 1 point inside other's square
      points = [
        Point.new(-1, 3),
        Point.new(0, 0),
        Point.new(0, -1),
        Point.new(0, -1.5),
        Point.new(0, -2),
        Point.new(-0.5, -1.5),
        Point.new(-1, -2),
        Point.new(1, -1),
        Point.new(0, -3),
      ]
      convex_hull_points = Algorithms[i].convex_hull(points)
      array1_sorted = convex_hull_points.sort_by { |point| [point.x, point.y] }
      array2_sorted = [Point.new(-1, 3), Point.new(0, -3), Point.new(1, -1.0), Point.new(-1, -2),].sort_by { |point| [point.x, point.y] }
      assert_equal array1_sorted, array2_sorted
    end
  end
end
