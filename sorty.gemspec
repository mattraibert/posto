# encoding: utf-8

Gem::Specification.new do |gem|
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.author = "Matt J Raibert"
  gem.bindir = 'bin'
  gem.description = %q{Sort your todo list.}
  gem.email = 'mattraibert@gmail.com'
  gem.executables = %w(sorty)
  gem.files = %w(Rakefile sorty.gemspec)
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("bin/**/*")
  gem.files += Dir.glob("test/**/*")
  gem.name = 'sorty'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if gem.respond_to? :required_rubygems_version=
  gem.summary = %q{Sort your todo list.}
  gem.test_files = Dir.glob("test/**/*")
  gem.version = "0.0.1"
end
