module D3
  class RadialAreaGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attributes_d3_block %i[
      angle
      startAngle
      endAngle
      radius
      innerRadius
      outerRadius
      defined
    ]

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def line_start_angle
      D3::RadialLineGenerator.new @native.JS.lineStartAngle
    end

    def line_end_angle
      D3::RadialLineGenerator.new @native.JS.lineEndAngle
    end

    def line_inner_radius
      D3::RadialLineGenerator.new @native.JS.lineInnerRadius
    end

    def line_outer_radius
      D3::RadialLineGenerator.new @native.JS.lineOuterRadius
    end
  end

  class << self
    def radial_area(data = nil)
      if data
        D3::RadialAreaGenerator.new @d3.JS.radialArea(data.to_n)
      else
        D3::RadialAreaGenerator.new @d3.JS.radialArea
      end
    end
  end
end
