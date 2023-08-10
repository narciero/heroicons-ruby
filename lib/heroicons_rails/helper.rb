# frozen_string_literal: true

module HeroiconsRails
  module Helper
    def heroicon(name, _options = {})
      f = File.open(file_path(name, "solid"))
      doc = Nokogiri::XML::Document.parse(f)
      doc.to_html.strip
    end

    def file_path(name, variant)
      File.join(ICONS_PATH, variant, "#{name}.svg")
    end
  end
end
