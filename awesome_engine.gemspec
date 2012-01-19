$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "awesome_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "awesome_engine"
  s.version     = AwesomeEngine::VERSION
  s.authors     = ["Reinado de Souza Junior"]
  s.email       = ["juniorz@gmail.com"]
  s.homepage    = "http://github.com/juniorz/"
  s.summary     = "TODO: Summary of AwesomeEngine."
  s.description = "TODO: Description of AwesomeEngine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", "~> 3.1.3"

end