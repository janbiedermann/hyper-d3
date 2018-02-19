module D3
  class SequentialScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attributes_d3 %i[domain clamp]

    def copy
      self.class.new @native.JS.copy
    end

    def interpolator(&block)
      if block_given?
        @native.JS.interpolator(block)
        self
      else
        @native.JS.interpolator
      end
    end
  end

  class << self
    def scale_sequential(&block)
      raise unless block_given?
      SequentialScale.new @d3.JS.scaleSequential(block)
    end
  end
end
