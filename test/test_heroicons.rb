# frozen_string_literal: true

require "test_helper"
require "nokogiri"

class TestHeroicons < Minitest::Test
  def setup
    @icon_name = "arrow-right"
  end

  def test_that_it_has_a_version_number
    refute_nil ::Heroicons::VERSION
  end

  def test_it_renders_icon_with_variant
    %i[mini solid outline].each do |variant|
      icon = Heroicons::Icon.new(name: @icon_name, variant: variant).render
      refute_nil icon

      doc = Nokogiri::XML(icon)
      svg = doc.at_css("svg")
      assert_equal variant == :mini ? "0 0 20 20" : "0 0 24 24", svg["viewBox"]
    end
  end

  def test_it_renders_nothing_if_icon_name_is_invalid
    icon = Heroicons::Icon.new(name: "non-existent-icon", variant: :solid).render
    assert_nil icon
  end

  def test_it_renders_nothing_if_icon_variant_is_invalid
    icon = Heroicons::Icon.new(name: @icon_name, variant: :non_existent_variant).render
    assert_nil icon
  end

  def test_it_renders_icon_with_custom_attributes
    custom_attributes = {
      title: "icon_title",
      class: "h-4 w-4"
    }

    icon = Heroicons::Icon.new(name: @icon_name, variant: :mini, options: custom_attributes).render
    doc = Nokogiri::XML(icon)
    svg = doc.at_css("svg")

    custom_attributes.each do |k, v|
      assert_equal v, svg[k]
    end
  end

  def test_config_variant
    assert_equal :solid, Heroicons.config.variant

    Heroicons.configure do |config|
      config.variant = :mini
    end

    assert_equal :mini, Heroicons.config.variant
  end
end
