class Triangle
  attr_accessor :sideone, :sidetwo, :sidethree

  def initialize(sideone, sidetwo, sidethree)
    @sideone = sideone
    @sidetwo = sidetwo
    @sidethree = sidethree
  end

  def kind
    validate_triangle
    if sideone == sidetwo && sidetwo == sidethree
      :equilateral
    elsif sideone == sidetwo || sidetwo == sidethree || sideone == sidethree
      :isosceles
    else :scalene
    end
  end

  def over_zero?
    [sideone, sidetwo, sidethree].all?(&:positive?)
  end

  def inequality?
    sideone + sidetwo > sidethree && sideone + sidethree > sidetwo && sidetwo + sidethree > sideone
  end

  def validate_triangle
    raise TriangleError unless over_zero? && inequality?
  end

  class TriangleError < StandardError
  end

end
