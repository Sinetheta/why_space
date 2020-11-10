module Websites
  class WebsiteBuilder
    extend Dry::Initializer

    param  :full_url

    option  :member, model: Member

    def call
      Website.create member: member, full_url: full_url, short_url: full_url
    end
  end
end
