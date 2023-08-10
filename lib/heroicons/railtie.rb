# frozen_string_literal: true

require "rails/railtie"

module Heroicons
  class Railtie < Rails::Railtie
    initializer "heroicons.action_view" do |_app|
      ActiveSupport.on_load :action_view do
        require "heroicons/helper"
        include Heroicons::Helper
      end
    end
  end
end
