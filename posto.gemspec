# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name = 'posto'
  gem.version = "0.0.3"
  gem.summary = "Sort your todo list."
  gem.description = "Sort your todo list."
  gem.author = "Matt J Raibert"
  gem.email = 'mattraibert@gmail.com'
  gem.executables = ["posto"]
  gem.files = ["Rakefile", "posto.gemspec"]
  gem.files += Dir["lib/**/*.rb"]
  gem.test_files = Dir["test/**/*"]
end
