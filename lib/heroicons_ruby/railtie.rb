# frozen_string_literal: true

require "rails/railtie"

module HeroiconsRuby
  class Railtie < Rails::Railtie
    initializer "heroicons_ruby.action_view" do |_app|
      ActiveSupport.on_load :action_view do
        require "heroicons_ruby/helper"
        include HeroiconsRuby::Helper
      end
    end
  end
end
