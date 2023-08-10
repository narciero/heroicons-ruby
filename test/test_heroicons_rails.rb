# frozen_string_literal: true

require "test_helper"

class TestHeroiconsRails < Minitest::Test
  include HeroiconsRails::Helper

  def test_that_it_has_a_version_number
    refute_nil ::HeroiconsRails::VERSION
  end

  def test_it_renders_svg
    icon = heroicon("arrow-right")

    pp icon

    refute_nil icon
  end
end
