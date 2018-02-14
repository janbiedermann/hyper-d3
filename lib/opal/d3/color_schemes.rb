module D3
  # requires d3-scale-chromatic

  class << self
    %w[Category10 Category20 Category20b Category20c
       Accent Dark2 Paired Pastel1 Pastel2 Set1 Set2 Set3].each do |native_category|
      
      eval <<-EOF
        def scheme_#{native_category.underscore.sub(/[123]/,'_\0')}
          `window.d3.scheme#{native_category}`
        end
      EOF
    end

    %w[Blues Greens Greys Oranges Purples Reds
       BrBG BuGn BuPu GnBu OrRd PRGn PiYG PuBu PuBuGn PuOr PuRd
       RdBu RdPu RdGy RdYlBu RdYlGn YlGn YlGnBu YlOrBr YlOrRd
       Spectral].each do |native_category|
      eval <<-EOF
        def interpolate_#{native_category.underscore}(k)
          `window.d3.interpolate#{native_category}(k)`
        end
        def scheme_#{native_category.underscore}(k)
          `window.d3.scheme#{native_category}[k]`
        end
      EOF
    end

    %w[Cool CubehelixDefault Inferno Magma Plasma Rainbow Viridis Warm].each do |native_category|
       eval <<-EOF
         def interpolate_#{native_category.underscore}(k)
           `window.d3.interpolate#{native_category}(k)`
         end
       EOF
     end
  end
end