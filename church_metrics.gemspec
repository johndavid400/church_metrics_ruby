$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "church_metrics"
  s.version     = "0.0.2"
  s.authors     = ["JD Warren"]
  s.email       = ["johndavid400@gmail.com"]
  s.homepage    = "https://github.com/johndavid400/church_metrics_ruby"
  s.summary     = "Lifechurch.tv Church Metrics API ruby implementation"
  s.description = "Ruby warapper for the Lifechurch.tv Church Metrics API"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rest-client"

end
