# frozen_string_literal: true

require_relative "lib/heroicons_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "heroicons-ruby"
  spec.version = HeroiconsRuby::VERSION
  spec.authors = ["narciero"]
  spec.email = ["narciero@me.com"]

  spec.summary = "Rails view helpers for Heroicons."
  spec.homepage = "https://github.com/narciero/heroicons-ruby"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/narciero/heroicons-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/narciero/heroicons-ruby/blob/main/CHANGELOG.md"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 6.0"
  spec.add_dependency "nokogiri", ">= 1.6"
end
