# frozen_string_literal: true

require_relative "lib/heroicons_rails/version"

Gem::Specification.new do |spec|
  spec.name = "heroicons-ror"
  spec.version = HeroiconsRails::VERSION
  spec.authors = ["narciero"]
  spec.email = ["narciero@me.com"]

  spec.summary = "Rails view helpers for Heroicons."
  spec.homepage = "https://github.com/narciero/heroicons-rails"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/narciero/heroicons-rails"
  spec.metadata["changelog_uri"] = "https://github.com/narciero/heroicons-rails/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview"
end
