module D3
  class LineGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attributes_d3_block %i[x y defined]

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end
  end

  class << self
    def line
      D3::LineGenerator.new @d3.JS.line
    end
  end
end
