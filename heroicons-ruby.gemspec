# frozen_string_literal: true

require_relative "lib/heroicons/version"

Gem::Specification.new do |spec|
  spec.name = "heroicons-ruby"
  spec.version = Heroicons::VERSION
  spec.authors = ["narciero"]
  spec.email = ["narciero@me.com"]
  spec.summary = "Rails view helpers for Heroicons."
  spec.homepage = "https://github.com/narciero/heroicons-ruby"
  spec.license = "MIT"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/narciero/heroicons-ruby",
    "changelog_uri" => "https://github.com/narciero/heroicons-ruby/blob/main/CHANGELOG.md"
  }

  spec.files = Dir["{lib,icons}/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "activesupport", ">= 6.0"
  spec.add_dependency "nokogiri", ">= 1.6"
end
