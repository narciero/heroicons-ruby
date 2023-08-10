# frozen_string_literal: true

module HeroiconsRails
  module Helper
    def heroicon(name, variant: :solid, **options)
      f = file(name.to_s, variant.to_s)
      return if f.nil?

      doc = Nokogiri::XML::Document.parse(f)
      svg = doc.at_css("svg")

      options.each do |k, v|
        svg[k.to_s] = v
      end

      doc.to_html.strip
    end

    private

    def file(name, variant)
      path = File.join(ICONS_PATH, variant, "#{name}.svg")

      begin
        File.open(path)
      rescue StandardError
        nil
      end
    end
  end
end
