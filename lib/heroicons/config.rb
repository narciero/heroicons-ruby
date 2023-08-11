# frozen_string_literal: true

module Heroicons
  class Config
    attr_accessor :variant

    def initialize
      @variant = :solid
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
