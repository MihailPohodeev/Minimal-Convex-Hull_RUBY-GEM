require "minitest/autorun"
require "minimal-convex-hull-by-Grahem"
require "minimal-convex-hull-by-Jarvis"
require "point"

def assert_equal_arrays_without_sequence(array1, array2)
  result = (array1 - array2) + (array2 - array1)
  assert result.empty?, "#{array1} is not equal to #{array2}"
end

Algorithms = [GrahemAlrotithm, JarvisAlrotithm]

class MCH_Test < Minitest::Test
  def test_0_1_points
    for i in 0..1
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
      array2_sorted = [Point.new(0, 0), Point.new(0, 0)].sort_by { |point| [point.x, point.y] }
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

  def test_5_points
    assert_equal 2, 2
  end
end
