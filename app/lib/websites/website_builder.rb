module Websites
  class WebsiteBuilder
    extend Dry::Initializer

    param  :full_url

    option  :member, model: Member
    option  :url_shortener, default: proc { UrlShortener }

    def call
      Website.create member: member, full_url: full_url, short_url: short_url
    end

    private

    def short_url
      url_shortener.new(full_url).call
    end
  end
end
