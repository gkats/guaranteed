$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
require 'guaranteed/version'

Gem::Specification.new do |s|
  s.name        = 'guaranteed'
  s.version     = Guaranteed::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Giannis Katsanos']
  s.email       = 'giannis.katsanos@gmail.com'
  s.homepage    = 'https://github.com/gkats/guaranteed'
  s.summary     = 'Make something out of nothing!'
  s.description = <<-DESC
    Guaranteed is a tiny library that ensures you always have an object to act upon.
    It eliminates checks for your object's capabilities.
  DESC
  s.license     = 'MIT'

  s.files        = Dir["{lib}/**/*.rb", "LICENSE", "*.md", "Rakefile"]
  s.test_files   = Dir["{test}/**/*.rb"]
  s.require_path = 'lib'

  s.required_rubygems_version = ">= 1.3.6"
end
