require 'open-uri'

module Websites
  # Scrapes a web urlf or the text context of its headings.
  # All headings from h1-h3 are considered equal. A simple array is returned.
  class HeadingsScraper
    extend Dry::Initializer

    param  :full_url

    HEADINGS_SELECTOR = 'h1, h2, h3'

    def call
      doc = Nokogiri::HTML(open(full_url))
      doc.css(HEADINGS_SELECTOR).map(&:text)
    end
  end
end
