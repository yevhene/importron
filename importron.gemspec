$:.push File.expand_path("../lib", __FILE__)

require "importron/version"

Gem::Specification.new do |s|
  s.name          = "importron"
  s.version       = Importron::VERSION
  s.authors       = ["Yevhene Shemet"]
  s.email         = ["yevhene@gmail.com"]
  s.description   = "Database data import tool."
  s.summary       = "Database data import tool."
  s.homepage      = ""
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "sequel", "~> 4.4"

  s.add_development_dependency "rspec", "~> 2.14"
end
