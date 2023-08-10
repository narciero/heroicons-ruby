# frozen_string_literal: true

require "heroicons_rails/version"
require "heroicons_rails/icon"
require "heroicons_rails/helper"
require "heroicons_rails/railtie" if defined?(Rails)

require "active_support"
require "nokogiri"

module HeroiconsRails
  ICONS_PATH = File.join(File.dirname(__FILE__), "../icons")
end
