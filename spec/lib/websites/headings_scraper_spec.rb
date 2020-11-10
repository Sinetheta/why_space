require 'rails_helper'

RSpec.describe Websites::HeadingsScraper, type: :model do
  let(:example_url) { 'https://www.iana.org/domains/reserved' }
  let(:headings_scraper) {
    described_class.new(example_url)
  }

  describe 'call' do
    subject { headings_scraper.call }

    it 'returns a list of the headings text on that webpage' do
      # Another place to VCR
      expect(subject).to eq([
        "IANA-managed Reserved Domains",
        "Example domains",
        "Test IDN top-level domains",
        "Policy-reserved domains",
        "Other Special-Use Domains",
        "Domain Names"
      ])
    end
  end
end
