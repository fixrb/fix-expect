# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = "fix-expect"
  spec.version      = File.read("VERSION.semver").chomp
  spec.author       = "Cyril Kato"
  spec.email        = "contact@cyril.email"
  spec.summary      = "Provides the expect syntax."
  spec.description  = "Fix extension gem to provide the expect syntax."
  spec.homepage     = "https://github.com/fixrb/fix-expect"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")
  spec.license      = "MIT"
  spec.files        = Dir["LICENSE.md", "README.md", "lib/**/*"]

  spec.add_dependency "fix", "1.0.0.beta4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop-md"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-thread_safety"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "spectus"
  spec.add_development_dependency "yard"
end
