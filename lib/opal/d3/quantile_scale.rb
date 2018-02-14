module D3
  class QuantileScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attributes_d3 %i[domain range]
    aliases_native %i[invertExtent quantiles]
    alias_native_new :copy
  end

  class << self
    def scale_quantile
      D3::QuantileScale.new @d3.JS.scaleQuantile
    end
  end
end
