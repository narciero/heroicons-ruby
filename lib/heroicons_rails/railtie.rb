# frozen_string_literal: true

require_relative "helper"

module HeroiconsRails
  class Railtie < Rails::Railtie
    initializer "heroicons_rails.helper" do
      ActiveSupport.on_load :action_view do
        include Helper
      end
    end
  end
end
