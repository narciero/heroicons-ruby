# frozen_string_literal: true

require "action_view/helpers" if defined?(Rails)

module Heroicons
  module Helper
    def heroicon(name, variant: Heroicons.config.variant, **options)
      icon = Heroicons::Icon.new(name: name, variant: variant, options: options)

      raw icon.render
    end
  end
end
