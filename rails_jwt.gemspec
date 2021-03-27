$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_jwt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails_jwt"
  spec.version     = RailsJwt::VERSION
  spec.authors     = ["Muhammad Aamir"]
  spec.email       = ["mail@aamir.pk"]
  spec.homepage    = "https://github.com/aamir-pk/rails_jwt"
  spec.summary     = "Super easy way to add JWT support for Rails API projects."
  spec.description = "This gem makes it super easy to add JWT support in your Rails project. Just a few of quick steps and you are good to go!"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6"
  spec.add_dependency "jwt", "~> 2.2.2"
end
