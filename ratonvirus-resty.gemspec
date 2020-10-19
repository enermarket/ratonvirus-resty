require_relative 'lib/ratonvirus/resty/version'

Gem::Specification.new do |spec|
  spec.name          = "ratonvirus-resty"
  spec.version       = Ratonvirus::Resty::VERSION
  spec.authors       = ["Eugen Müller"]
  spec.email         = ["eugen.mueller@enermarket.de"]

  spec.summary       = %q{Restfull scanner for Ratonvirus}
  spec.description   = %q{Ratonviurs scanner based on a ClamAv Rest service. Expect a Restservice based on https://github.com/ajilaag/clamav-rest}
  spec.homepage      = "https://github.com/enermarket/ratonvirus-resty.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir[
    "spec/",
    "lib/**/*",
    "CHANGELOG.md",
    "LICENSE",
    "README.md"
  ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.0.0"
  spec.add_dependency "mimemagic", "~> 0.3.5"
  spec.add_dependency "ratonvirus", "~> 0.2.0"
  spec.add_dependency 'activesupport'

  # Test helper
  spec.add_development_dependency "webmock"
  spec.add_development_dependency 'pry', '~> 0.13.1'

  # Code coverage
  spec.add_development_dependency "simplecov", "~> 0.18.0"

  # Rubocop linter
  spec.add_development_dependency "rubocop", "~> 0.86.0"
  spec.add_development_dependency "rubocop-rspec", "~> 1.40"
end
