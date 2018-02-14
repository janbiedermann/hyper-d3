module D3
  class QuantizeScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attributes_d3 %i[domain range]
    aliases_native %i[invertExtent ticks tickFormat]
    alias_native_chainable :nice
    alias_native_new :copy
  end

  class << self
    def scale_quantize
      D3::QuantizeScale.new @d3.JS.scaleQuantize
    end
  end
end
