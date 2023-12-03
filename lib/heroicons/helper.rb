# frozen_string_literal: true

require "action_view/helpers" if defined?(Rails)

module Heroicons
  module Helper
    def heroicon(name, variant: Heroicons.config.variant, **attributes)
      icon = Heroicons::Icon.new(name: name,
                                 variant: variant,
                                 attributes: Heroicons.config.attributes[variant].merge(attributes))

      raw icon.render
    end
  end
end
