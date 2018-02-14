# all these methods return indexes not values
module D3
  class Bisector
    include D3::Native
    alias_native_new :left
    alias_native_new :right
  end

  class << self
    aliases_d3 %i[
      ascending
      descending
      bisect
      bisectLeft
      bisectRight
    ]

    def scan(array, &block)
      if block_given?
        @d3.JS.scan(array, block)
      else
        @d3.JS.scan(array)
      end
    end

    def bisector(&block)
      D3::Bisector.new @d3.JS.bisector(block)
    end
  end
end
