# frozen_string_literal: true

require_relative "heroicons_rails/version"
require_relative "heroicons_rails/helper"
require_relative "heroicons_rails/railtie" if defined? Rails

require "nokogiri"

module HeroiconsRails
  ICONS_PATH = File.join(File.dirname(__FILE__), "../icons")
end
