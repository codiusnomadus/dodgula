
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dodgula/version"

Gem::Specification.new do |spec|
  spec.name          = "dodgula"
  spec.version       = Dodgula::VERSION
  spec.authors       = ["Codius Nomadus"]
  spec.email         = ["thecodenomad@gmail.com"]

  spec.summary       = %q{Convert everyday boring English into doge speak!}
  spec.homepage      = "https://github.com/codiusnomadus/dodgula"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'engtagger'

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
