module D3
  class AreaGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attributes_d3_block %i[
      x x0 x1 y y0 y1 defined
    ]

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def area_radial(data = nil)
      D3::RadialAreaGenerator.radial_area(data)
    end

    def line_x0
      D3::LineGenerator.new @native.JS.lineX0
    end

    def line_x1
      D3::LineGenerator.new @native.JS.lineX1
    end

    def line_y0
      D3::LineGenerator.new @native.JS.lineY0
    end

    def line_y1
      D3::LineGenerator.new @native.JS.lineY1
    end
  end

  class << self
    def area(data = nil)
      if data
        D3::AreaGenerator.new @d3.JS.area(data.to_n)
      else
        D3::AreaGenerator.new @d3.JS.area
      end
    end
  end
end
