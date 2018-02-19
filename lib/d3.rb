require "opal"

require 'active_support/core_ext/string'

class Module
  def aliases_d3(native_names)
    native_names.each do |native_name|
      alias_d3(native_name.underscore, native_name)
    end
  end
  
  def alias_d3(ruby_name, js_name=ruby_name)
    define_method(ruby_name) do |*args|
      @d3.JS[js_name].JS.apply(@d3, `Opal.to_a(args)`)
    end
  end
end

module D3
  @d3 = `window.d3`
  class << self
  end
end
# Metaclass:
require "d3/native"

# Everything else:
require "d3/arc"
require "d3/area"
require "d3/axis"
require "d3/band_scale"
require "d3/collections"
require "d3/color"
require "d3/color_schemes"
require "d3/continuous_scale"
require "d3/creator"
require "d3/curve"
require "d3/dsv"
require "d3/ease"
require "d3/format"
require "d3/histograms"
require "d3/interpolate"
require "d3/line"
require "d3/map"
require "d3/misc"
require "d3/nest"
require "d3/ordinal_scale"
require "d3/path"
require "d3/pie"
require "d3/point_scale"
require "d3/polygon"
require "d3/quadtree"
require "d3/quantile_scale"
require "d3/quantize_scale"
require "d3/radial_area"
require "d3/radial_line"
require "d3/random"
require "d3/search"
require "d3/selection"
require "d3/sequential_scale"
require "d3/set"
require "d3/stack"
require "d3/statistics"
require "d3/symbol"
require "d3/threshold_scale"
require "d3/time_format"
require "d3/time_interval"
require "d3/transformations"
