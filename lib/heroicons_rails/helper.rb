# frozen_string_literal: true

require "action_view/helpers" if defined?(Rails)

module HeroiconsRails
  module Helper
    def heroicon(name, variant: :solid, **options)
      icon = HeroiconsRails::Icon.new(
        name: name,
        variant: variant,
        options: options
      )

      raw icon.render
    end
  end
end
