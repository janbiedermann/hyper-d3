require_relative "lib/hyperloop/d3/version"

Gem::Specification.new do |s|
  s.name         = "hyper-d3"
  s.version      = Hyperloop::D3::VERSION
  s.author       = "Jan Biedermann, Tomasz Wegrzanowski"
  s.email        = "jan@kursator.de"
  s.homepage     = "https://github.com/janbiedermann/hyper-d3"
  s.summary      = "Ruby bindings for D3 as a Ruby Hyperloop Component"
  s.description  = "Write React Components in ruby to show graphics created with D3.js"

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ["lib"]

  s.add_runtime_dependency "opal", "~> 0.11.0"
  s.add_runtime_dependency "opal-activesupport", "~> 0.3.1"
  s.add_runtime_dependency "hyper-component", "~> 1.0.0.lap23"
  s.add_runtime_dependency "hyperloop-config", "~> 1.0.0.lap23"
  s.add_development_dependency "hyperloop", "~> 1.0.0.lap23"
  s.add_development_dependency "hyper-spec", "~> 1.0.0.lap23"
  s.add_development_dependency "listen"
  s.add_development_dependency "rake", ">= 11.3.0"
  s.add_development_dependency "rails", ">= 5.1.0"
  s.add_development_dependency "sqlite3"
end
