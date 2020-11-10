require 'open-uri'

module Websites
  # A stand-in for the HeadingsScraper which doesn't actually scrape the url.
  class DummyHeadingsScraper
    extend Dry::Initializer

    param  :full_url
    def call
      ['Main heading', 'Another Heading', 'A Third Heading']
    end
  end
end
