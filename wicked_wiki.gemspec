$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wicked_wiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wicked_wiki"
  s.version     = WickedWiki::VERSION
  s.authors     = "Steven Wang"
  s.email       = "3460883@gmail.com"

  s.summary     = "The Wicked Engine for Rails 4"
  s.description = "The Wicked Engine for Rails 4"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'devise', '~>3.2.0' 
  s.add_development_dependency 'rspec-rails', '~> 2.1'
  s.add_development_dependency 'capybara', '2.1'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'faker', '1.1.2'

  s.add_dependency 'bootstrap-sass', '~> 3.1'
  s.add_dependency "paperclip"
  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "bundler", "~> 1.5"
  s.add_dependency "redcarpet", "~>3.0"
  s.add_dependency "paperclip-meta"
  s.add_dependency "rouge", "~>1.3"
  s.add_dependency "sass-rails", "~>4.0.0"
  s.add_dependency "friendly_id", '~>5.0.0'
  s.add_dependency "tire"
end
