require "hyperloop-config"
require "hyper-component"
Hyperloop.import "d3/source/d3.js", client_only: true
Hyperloop.import "d3/source/d3-drag.js", client_only: true
Hyperloop.import "d3/source/d3-scale-chromatic.js", client_only: true
Hyperloop.import "hyper-d3"
require "opal-activesupport"
require "hyperloop/d3/version"

if RUBY_ENGINE == 'opal'
  require "d3"
  require "hyper-component"
  require "hyperloop/d3/mixin"
  require "hyperloop/d3/component"
else
  Opal.append_path __dir__.untaint
end