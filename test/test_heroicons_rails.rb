# frozen_string_literal: true

require "test_helper"
require "nokogiri"

class TestHeroiconsRails < Minitest::Test
  include HeroiconsRails::Helper

  def setup
    @icon_name = "arrow-right"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HeroiconsRails::VERSION
  end

  def test_it_renders_icon
    icon = heroicon(@icon_name)
    refute_nil icon

    doc = Nokogiri::XML(icon)
    svg = doc.at_css("svg")
    assert_equal svg["viewBox"], "0 0 24 24"
  end

  def test_it_renders_icon_with_variant
    %i[mini solid outline].each do |variant|
      icon = heroicon(@icon_name, variant: variant)
      refute_nil icon
    end
  end

  def test_it_renders_nothing_if_icon_name_is_invalid
    icon = heroicon("non-existent-icon")
    assert_nil icon
  end

  def test_it_renders_nothing_if_icon_variant_is_invalid
    icon = heroicon(@icon_name, variant: :non_existent_variant)
    assert_nil icon
  end
end
