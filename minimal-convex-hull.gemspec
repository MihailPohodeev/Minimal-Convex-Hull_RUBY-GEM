Gem::Specification.new do |s|
  s.name        = "minimal-convex-hull"
  s.version     = "0.0.3"
  s.summary     = "MCH!"
  s.description = "Grahem's and Jarvis's algorithms finding minimal convex hull"
  s.authors     = ["Mikhail Pokhodeev", "Konstantin Pinchuk"]
  s.email       = "mishapohodeev@yandex.ru"
  s.files       = ["lib/minimal-convex-hull-by-Grahem.rb", "lib/minimal-convex-hull-by-Jarvis.rb", "lib/point.rb", "lib/minimal-convex-hull.rb"]
  s.homepage    = "https://github.com/MihailPohodeev/Minimal-Convex-Hull_RUBY-GEM/issues?q=is%3Aissue+is%3Aclosed"
  s.license       = "MIT"
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'minitests', '~> 5.15.0'
end
