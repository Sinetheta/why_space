module Websites
  # A stand-in for the UrlShortener which doesn't require a real API to hit.
  class DummyUrlShortener
    extend Dry::Initializer

    param  :full_url

    def call
      full_url
    end
  end
end
