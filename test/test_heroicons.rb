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
    view_boxes = {
      micro: "0 0 16 16",
      mini: "0 0 20 20",
      solid: "0 0 24 24",
      outline: "0 0 24 24"
    }

    %i[micro mini solid outline].each do |variant|
      icon = Heroicons::Icon.new(name: @icon_name, variant: variant).render
      refute_nil icon

      doc = Nokogiri::XML(icon)
      svg = doc.at_css("svg")
      assert_equal view_boxes[variant], svg["viewBox"]
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
      title: "title",
      class: "h-4 w-4",
      stroke_width: "2%",
      "fill-opacity": 0.7,
      viewBox: "0 0 50 50"
    }

    icon = Heroicons::Icon.new(name: @icon_name, variant: :mini, attributes: custom_attributes).render
    doc = Nokogiri::XML(icon)
    svg = doc.at_css("svg")

    assert_equal "title", svg["title"]
    assert_equal "h-4 w-4", svg["class"]
    assert_equal "2%", svg["stroke-width"]
    assert_equal "0.7", svg["fill-opacity"]
    assert_equal "0 0 50 50", svg["viewBox"]
  end

  def test_it_configures_variant
    assert_equal :solid, Heroicons.config.variant

    Heroicons.configure do |config|
      config.variant = :mini
    end

    assert_equal :mini, Heroicons.config.variant
  end

  def test_it_configures_attributes
    assert_equal({}, Heroicons.config.attributes)

    Heroicons.configure do |config|
      config.attributes[:solid] = { class: "h-6 w-6" }
    end

    assert_equal({ solid: { class: "h-6 w-6" } }, Heroicons.config.attributes)
  end

  # def test_it_renders_via_helper
  #   heroicon "check"
  # end
end
