require 'rails_helper'
require 'open-uri'

RSpec.describe Websites::DummyUrlShortener, type: :model do
  let(:valid_url) { 'https://exmaple.com' }
  let(:url_shortener) {
    described_class.new(valid_url)
  }

  describe 'call' do
    subject { url_shortener.call }

    it 'returns the same url' do
      expect(subject).to eq(valid_url)
    end

    it 'returns a valid url' do
      # Good place to VCR
      expect(open(subject).status).to eq(["200", "OK"])
    end
  end
end
