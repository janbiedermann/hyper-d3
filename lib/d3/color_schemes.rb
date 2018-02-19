module D3
  # requires d3-scale-chromatic

  class << self
    %w[Category10 Category20 Category20b Category20c
       Accent Dark2 Paired Pastel1 Pastel2 Set1 Set2 Set3].each do |native_category|
      define_method("scheme_#{native_category.underscore.sub(/[123]/,'_\0')}") do
        `window.d3`.JS["scheme#{native_category}"]
      end
    end

    %w[Blues Greens Greys Oranges Purples Reds
       BrBG BuGn BuPu GnBu OrRd PRGn PiYG PuBu PuBuGn PuOr PuRd
       RdBu RdPu RdGy RdYlBu RdYlGn YlGn YlGnBu YlOrBr YlOrRd
       Spectral].each do |native_category|
      define_method("interpolate_#{native_category.underscore}") do |k|
        `window.d3`.JS["interpolate#{native_category}"].JS.apply(`window.d3`, `Opal.to_a(k)`)
      end
      define_method("scheme_#{native_category.underscore}") do |k=nil|
        if k
          `window.d3`.JS["scheme#{native_category}"][k]
        else
          `window.d3`.JS["scheme#{native_category}"]
        end
      end
    end

    %w[Cool CubehelixDefault Inferno Magma Plasma Rainbow Viridis Warm].each do |native_category|
      define_method("interpolate_#{native_category.underscore}") do |k|
        `window.d3`.JS["interpolate#{native_category}"].JS.apply(`window.d3`, `Opal.to_a(k)`)
      end
    end
  end
end