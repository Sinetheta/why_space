require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'with valid attributes' do
    let(:valid_attributes) { {
      full_name: "Louis Pasteur",
      user: build(:user)
    } }

    it 'is valid' do
      member = described_class.new(valid_attributes)
      expect(member.valid?).to be(true)
    end

    it 'has a working factory' do
      member = build(:member)
      expect(member.valid?).to be(true)
    end
  end

  describe 'full_name validations' do
    it 'requires a full_name' do
      member = build(:member, full_name: nil)
      expect(member.valid?).to be(false)
    end
  end
end
