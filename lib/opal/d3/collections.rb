module D3
  class << self
    aliases_d3 %i[keys values]

    def entries(obj)
      @d3.JS.entries(obj).map{|o| [`o.key`, `o.value`]}
    end
  end
end
