# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'fix-expect'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Kato']
  spec.email         = ['contact@cyril.email']
  spec.summary       = 'Provides the expect syntax.'
  spec.description   = 'Fix extension gem to provide the expect syntax.'
  spec.homepage      = 'https://github.com/fixrb/fix-expect'
  spec.license       = 'MIT'
  spec.files         = Dir['LICENSE.md', 'README.md', 'lib/**/*']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'fix',      '~> 1.0.0.beta3'
  spec.add_dependency 'spectus',  '~> 3.1.2'

  spec.add_development_dependency 'bundler',    '~> 2.1'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop',    '~> 0.79'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'spectus',    '~> 3.1'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
