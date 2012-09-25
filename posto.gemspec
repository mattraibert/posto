# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name = 'posto'
  gem.version = "0.3.5.SNAPSHOT"
  gem.license = "GPLv3"
  gem.summary = "CLI to sort your todo list."
  gem.description = "Sort your todo list from the command line."
  gem.homepage = "http://github.com/mattraibert/posto"
  gem.author = "Matt J Raibert"
  gem.email = 'mattraibert@gmail.com'
  gem.executables = ["posto"]
  gem.files = ["Rakefile", "README.md", "LICENSE.txt"]
  gem.files += Dir["lib/**/*"]
  gem.test_files = Dir["test/**/*"]
  gem.add_dependency('activesupport')
  gem.add_dependency('highline')
  gem.add_dependency('five_leaves')
  gem.add_development_dependency('bundler')
  gem.add_development_dependency('grasshopper')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('pry')
end
