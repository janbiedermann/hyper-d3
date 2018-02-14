module D3
  class PointScale
    include D3::Native

    def call(t)
      v = @native.call(t)
      `v === undefined ? nil : v`
    end
    attributes_d3 %i[
      domain
      range
      rangeRound
      padding
      align
      round
    ]
    alias_native_new :copy
    alias_native :bandwidth
    alias_native :step
  end

  class << self
    def scale_point
      D3::PointScale.new @d3.JS.scalePoint
    end
  end
end
