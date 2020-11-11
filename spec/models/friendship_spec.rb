require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'with valid attributes' do
    let(:valid_attributes) { {
      from_member: build(:member),
      to_member: build(:member)
    } }

    it 'is valid' do
      friendship = described_class.new(valid_attributes)
      expect(friendship.valid?).to be(true)
    end
  end
end
