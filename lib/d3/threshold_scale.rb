module D3
  class ThresholdScale
    include D3::Native
    attributes_d3 %i[domain range]
    alias_native_new :copy

    def call(t)
      @native.call(t)
    end

    def invert_extent(t)
      a,b = @native.JS.invertExtent(t)
      [`a === undefined ? nil : a`, `b === undefined ? nil : b`]
    end
  end

  class << self
    def scale_threshold
      D3::ThresholdScale.new @d3.JS.scaleThreshold
    end
  end
end
