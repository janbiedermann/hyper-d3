module D3
  class BandScale
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
      paddingInner
      paddingOuter
      align
      round
    ]

    alias_native_new :copy
    
    aliases_native %i[bandwidth step]
  end

  class << self
    def scale_band(*args)
      D3::BandScale.new @d3.JS.scaleBand(*args)
    end
  end
end
