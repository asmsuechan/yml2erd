# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yml2erd/version'

Gem::Specification.new do |spec|
  spec.name          = "yml2erd"
  spec.version       = Yml2erd::VERSION
  spec.authors       = ["asmsuechan"]
  spec.email         = ["suenagaryoutaabc@gmail.com"]

  spec.summary       = %q{This gem allows us to generate erd easily.}
  spec.description   = %q{Convert simple yml to erd}
  spec.homepage      = "https://github.com/asmsuechan/yml2erd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-graphviz"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "pry-byebug"
end
