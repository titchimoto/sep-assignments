require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = { }
  end

  def insert(pixel, x, y)
    inbounds(x, y) ? matrix["#{x}, #{y}"] = pixel : "Invalid. Pixel out of bounds."
  end

  def at(x, y)
    inbounds(x, y) ? matrix["#{x}, #{y}"] : "Invalid. Pixel out of bounds."
  end

  private

  def inbounds(x, y)
    (x > 0 && x <= width) && (y > 0 && y <= height)
  end

end
