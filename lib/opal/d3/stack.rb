module D3
  class StackGenerator
    include D3::Native

    attributes_d3_block %i[keys value order offset]
  end

  class << self
    def stack
      D3::StackGenerator.new @d3.JS.stack
    end
  end
end
