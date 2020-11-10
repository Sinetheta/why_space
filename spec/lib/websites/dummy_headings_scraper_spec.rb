require 'rails_helper'

RSpec.describe Websites::DummyHeadingsScraper, type: :model do
  let(:example_url) { 'https://www.iana.org/domains/reserved' }
  let(:headings_scraper) {
    described_class.new(example_url)
  }

  describe 'call' do
    subject { headings_scraper.call }

    it 'returns a pre-fabricated list of fake headings text' do
      expect(subject).to eq([
        'Main heading',
        'Another Heading',
        'A Third Heading'
      ])
    end
  end
end
