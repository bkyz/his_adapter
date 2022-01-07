require_relative "lib/his_adapter/version"

Gem::Specification.new do |spec|
  spec.name        = "his_adapter"
  spec.version     = HisAdapter::VERSION
  spec.authors     = ["ian"]
  spec.email       = ["ianlynxk@gmail.com"]
  spec.homepage    = "https://github.com/bkyz/his_adapter"
  spec.summary     = "Summary of HisAdapter."
  spec.description = "Description of HisAdapter."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =  spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_dependency "rails", "~> 7.0.0"
  spec.add_dependency "savon"
  spec.add_dependency "faraday"
  spec.add_dependency "rexml"
  spec.add_development_dependency "puma"
end
