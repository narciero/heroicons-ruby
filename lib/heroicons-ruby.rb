# frozen_string_literal: true

require "heroicons/version"
require "heroicons/config"
require "heroicons/icon"
require "heroicons/helper"
require "heroicons/railtie" if defined?(Rails)

require "active_support"
require "nokogiri"

module Heroicons
  ICONS_PATH = File.join(File.dirname(__FILE__), "../icons")
end
