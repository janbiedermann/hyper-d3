module D3
  class ArcGenerator
    include D3::Native
    def call(*args)
      @native.call(*args)
    end

    attributes_d3_block %i[
      innerRadius
      outerRadius
      cornerRadius
      padRadius
      startAngle
      endAngle
      padAngle
    ]
    alias_native_new :centroid
  end

  class << self
    def arc(prop_hash = nil)
      if prop_hash
        D3::ArcGenerator.new @d3.JS.arc(prop_hash.to_n)
      else
        D3::ArcGenerator.new @d3.JS.arc
      end
    end
  end
end
