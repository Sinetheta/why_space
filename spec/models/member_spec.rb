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

  describe '#friends' do
    let!(:member) { create(:member) }
    let!(:invitee) { create(:member) }
    let!(:inviter) { create(:member) }
    let!(:stranger) { create(:member) }

    before do
      create(:friendship, from_member: member, to_member: invitee)
      create(:friendship, from_member: inviter, to_member: member)
    end

    subject { member.friends }

    it 'returns all members who are friends only' do
      expect(subject).to contain_exactly(invitee, inviter)
    end
  end

  describe '#elligible_friends' do
    let!(:member) { create(:member) }
    let!(:friend) { create(:member) }
    let!(:stranger) { create(:member) }

    before do
      create(:friendship, from_member: member, to_member: friend)
    end

    subject { member.elligible_friends }

    it 'returns all members who are NOT friends only' do
      expect(subject).to contain_exactly(stranger)
    end
  end
end
