module Websites
  # Uses a headings_scraper to find the topics to generate Passion records
  # for a given Member from a given Website.
  class PassionsFactory
    extend Dry::Initializer

    param  :member, model: Member
    param  :website, model: Website
    option  :headings_scraper, default: proc { HeadingsScraper }

    def call
      headings.map do |heading|
        Passion.create(topic: heading, member: member, website: website)
      end
    end

    private

    def headings
      headings_scraper.new(website.full_url).call
    end
  end
end
