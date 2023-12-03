# frozen_string_literal: true

module Heroicons
  class Config
    attr_accessor :variant, :attributes

    def initialize
      @variant = :solid
      @attributes = Hash.new { |_hash, _key| {} }
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
