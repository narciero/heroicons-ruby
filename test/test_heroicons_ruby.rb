# frozen_string_literal: true

require "test_helper"
require "nokogiri"

class TestHeroiconsRuby < Minitest::Test
  include HeroiconsRuby::Helper

  def setup
    @icon_name = "arrow-right"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HeroiconsRuby::VERSION
  end

  def test_it_renders_icon
    icon = heroicon(@icon_name)
    refute_nil icon

    doc = Nokogiri::XML(icon)
    svg = doc.at_css("svg")
    assert_equal "0 0 24 24", svg["viewBox"]
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

  def test_it_renders_icon_with_custom_attributes
    custom_attributes = {
      title: "icon_title",
      class: "h-4 w-4"
    }

    icon = heroicon(@icon_name, variant: :mini, **custom_attributes)
    doc = Nokogiri::XML(icon)
    svg = doc.at_css("svg")

    custom_attributes.each do |k, v|
      assert_equal v, svg[k]
    end
  end
end
