require 'rails_helper'

RSpec.describe Websites::WebsiteBuilder, type: :model do
  let(:full_url) { 'https://exmaple.com/some/long?link' }
  let(:member) { create(:member) }
  let(:website_builder) {
    described_class.new(
      full_url,
      member: member,
      url_shortener: Websites::DummyUrlShortener
    )
  }

  describe 'call' do
    subject { website_builder.call }

    it 'returns a Website' do
      is_expected.to be_a(Website)
    end

    it 'has the correct member' do
      expect(subject.member).to be(member)
    end

    it 'has the correct full_url' do
      expect(subject.full_url).to eq(full_url)
    end
  end
end
