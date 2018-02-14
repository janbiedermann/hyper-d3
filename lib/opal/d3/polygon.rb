module D3
  class << self
    # This could maybe use more OO interface in addition to this?
    # Like D3::Polygon.new(points).area etc.

    aliases_d3 %i[
      polygonArea
      polygonCentroid
      polygonContains
      polygonLength
    ]

    def polygon_hull(points)
      hull = @d3.JS.polygonHull(points)
      `hull === null ? nil : hull`
    end
  end
end
