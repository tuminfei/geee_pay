# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geee_pay/version"

Gem::Specification.new do |spec|
  spec.name          = "geee_pay"
  spec.version       = GeeePay::VERSION
  spec.authors       = ["Terry.Tu"]
  spec.email         = ["tuminfei1981@gmail.com"]

  spec.summary       = %q{Geee Pay.}
  spec.description   = %q{Geee Pay.}
  spec.homepage      = "https://github.com/tuminfei/geee_pay"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
