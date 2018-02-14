module D3
  class PieGenerator
    include D3::Native
    def call(*args)
      @native.call(*args).map{|o|
        `Opal.hash({ data: o.data, index: o.index, value: o.value, start_angle: o.startAngle, end_angle: o.endAngle, pad_angle: o.padAngle })`
      }
    end

    attributes_d3_block %i[
      startAngle
      endAngle
      padAngle
      value
      sort
      sortValues
    ]
  end

  class << self
    def pie
      D3::PieGenerator.new @d3.JS.pie
    end
  end
end
