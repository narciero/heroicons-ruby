# frozen_string_literal: true

require "heroicons_ruby/version"
require "heroicons_ruby/icon"
require "heroicons_ruby/helper"
require "heroicons_ruby/railtie" if defined?(Rails)

require "active_support"
require "nokogiri"

module HeroiconsRuby
  ICONS_PATH = File.join(File.dirname(__FILE__), "../icons")
end
