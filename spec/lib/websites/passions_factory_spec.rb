require 'rails_helper'

RSpec.describe Websites::PassionsFactory, type: :model do
  let(:member) { create(:member) }
  let(:website) { create(:website) }
  let(:passions_factory) {
    described_class.new(
      member,
      website,
      headings_scraper: Websites::DummyHeadingsScraper
    )
  }

  describe 'call' do
    subject { passions_factory.call }

    it 'returns the website headings as a list of Member Passions' do
      expect(subject).to match_array([
        have_attributes(class: Passion, member: member, website: website, topic: 'Main heading'),
        have_attributes(class: Passion, member: member, website: website, topic: 'Another Heading'),
        have_attributes(class: Passion, member: member, website: website, topic: 'A Third Heading')
      ])
    end
  end
end
