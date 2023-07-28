# frozen_string_literal: true

require File.expand_path('lib/level_travel_rails/version', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'level_travel_rails'
  spec.version = LevelTravelRails::VERSION
  spec.authors = ['David Rybolovlev', 'Pavel Rodionov']
  spec.email = %w[golifox911@gmail.com pasha.rod@mail.ru]
  spec.summary = 'Level Travel wrapper gem for Ruby and Rails.'
  spec.description = 'This gem allow search tours on Level Travel and get offer.'
  spec.homepage = 'https://github.com/golifox/level-travel'
  spec.license = 'MIT'
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.7.4'

  spec.files = `git ls-files -z`.split("\x0")

  spec.add_dependency 'oj'
  spec.add_dependency 'faraday'
  spec.add_dependency 'dry-struct', '~> 1.6'
  spec.add_dependency 'dry-types', '~> 1.7'
  spec.add_dependency 'dry-validation', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'reek', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.18'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.22'
  spec.add_development_dependency 'simplecov', '~> 0.22'
  spec.add_development_dependency 'codecov', '~> 0.1'
  spec.add_development_dependency 'webmock', '~> 3.18'
  spec.add_development_dependency 'dotenv', '~> 2.5'
  spec.add_development_dependency 'vcr', '~> 6.0'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
