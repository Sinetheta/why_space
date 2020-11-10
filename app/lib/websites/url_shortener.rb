module Websites
  # Creates shortlinks using Bitly. Requires a valid Bitly API key.
  class UrlShortener
    extend Dry::Initializer

    param  :full_url

    def call
      bitlink = client.shorten(long_url: full_url)
      bitlink.link
    end

    private

    def client
      Bitly::API::Client.new(token: ENV['BITLY_API_KEY'])
    end
  end
end
