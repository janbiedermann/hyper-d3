module D3
  class Set
    include D3::Native
    alias_native :empty?, :empty
    alias_native :has?, :has
    aliases_native %i[size values]
    aliases_native_chainable %i[add clear remove]

    def each(&block)
      @native.JS.each(block)
      self
    end

    def inspect
      "#<D3::Set: {#{ values.join(", ") }}>"
    end
  end

  class << self
    def set(array=nil, &block)
      if block_given?
        D3::Set.new @d3.JS.set(array, proc{|x| yield(x)})
      elsif array
        D3::Set.new @d3.JS.set(array)
      else
        D3::Set.new @d3.JS.set()
      end
    end
  end
end
