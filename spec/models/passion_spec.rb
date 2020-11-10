require 'rails_helper'

RSpec.describe Passion, type: :model do
  context 'with valid attributes' do
    let(:valid_attributes) { {
      topic: 'Anything At All',
      member: build(:member),
      website: build(:website)
    } }

    it 'is valid' do
      passion = described_class.new(valid_attributes)
      expect(passion.valid?).to be(true)
    end

    it 'has a working factory' do
      website = build(:website)
      expect(website.valid?).to be(true)
    end
  end
end
