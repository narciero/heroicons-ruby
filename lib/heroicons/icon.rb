# frozen_string_literal: true

module Heroicons
  class Icon
    def initialize(name:, variant:, options: {})
      @name = name
      @variant = variant
      @options = options
    end

    def render
      return if file.nil?

      doc = Nokogiri::XML::Document.parse(file)
      svg = doc.at_css("svg")

      @options.each do |k, v|
        svg[dasherize(k.to_s)] = v
      end

      doc.to_html.strip
    end

    private

    def file
      @file ||= File.read(path).force_encoding("UTF-8")
    rescue StandardError
      nil
    end

    def path
      File.join(ICONS_PATH, @variant.to_s, "#{@name}.svg")
    end

    def dasherize(s)
      s.gsub(/_/, "-")
    end
  end
end
