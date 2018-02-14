module D3
  class Path
    include D3::Native

    # D3 methods aren't chainable, but there's no reason why they shouldn't be
    aliases_native_chainable %i[
      moveTo
      closePath
      lineTo
      quadraticCurveTo
      bezierCurveTo
      arcTo
      arc
      rect
    ]
    alias_native :to_s, :toString
  end

  class << self
    def path
      D3::Path.new @d3.JS.path
    end
  end
end
