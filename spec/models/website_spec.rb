require 'rails_helper'

RSpec.describe Website, type: :model do
  context 'with valid attributes' do
    let(:valid_attributes) { {
      full_url: "https://exmaple.com/some/long?link",
      short_url: "https://sl.com",
      member: build(:member)
    } }

    it 'is valid' do
      website = described_class.new(valid_attributes)
      expect(website.valid?).to be(true)
    end

    it 'has a working factory' do
      website = build(:website)
      expect(website.valid?).to be(true)
    end
  end
end
