require 'rails_helper'
require 'open-uri'

RSpec.describe Websites::UrlShortener, type: :model do
  let(:full_url) { 'https://exmaple.com' }
  let(:url_shortener) {
    described_class.new(full_url)
  }

  describe 'call' do
    subject { url_shortener.call }

    it 'returns a bitly url' do
      expect(subject).to start_with('https://bit.ly')
    end

    it 'returns a valid url' do
      # Good place to VCR
      expect(URI.open(subject).status).to eq(["200", "OK"])
    end
  end
end
