# frozen_string_literal: true

require "rails/railtie"

module HeroiconsRails
  class Railtie < Rails::Railtie
    initializer "heroicons_rails.action_view" do |_app|
      ActiveSupport.on_load :action_view do
        require "heroicons_rails/helper"
        include HeroiconsRails::Helper
      end
    end
  end
end
