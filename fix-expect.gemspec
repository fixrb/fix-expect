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

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fix',                    '~> 0.17.1'

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 12.3'
  spec.add_development_dependency 'rubocop',    '~> 0.67'
  spec.add_development_dependency 'simplecov',  '~> 0.16'
  spec.add_development_dependency 'spectus',    '~> 3.0'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
