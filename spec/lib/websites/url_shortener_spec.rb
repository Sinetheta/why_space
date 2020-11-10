require 'rails_helper'
require 'open-uri'


RSpec.describe Websites::UrlShortener, type: :model do
  let(:full_url) { 'https://exmaple.com' }
  let(:url_shortener) {
    described_class.new(full_url)
  }

  describe 'call' do
    subject { url_shortener.call }

    it 'returns a valid url' do
      # Good place to VCR
      expect(open(subject).status).to eq(["200", "OK"])
    end
  end
end
