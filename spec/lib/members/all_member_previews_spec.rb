require 'rails_helper'

RSpec.describe Members::AllMemberPreviews, type: :model do
  let!(:member1) { create(:member, full_name: 'One') }
  let!(:member2) { create(:member, full_name: 'Two') }
  let!(:member3) { create(:member, full_name: 'Three') }
  let!(:member4) { create(:member, full_name: 'Four') }

  let!(:web1) { create(:website, member: member1, short_url: 'https://ex.com/1') }
  let!(:web2) { create(:website, member: member2, short_url: 'https://ex.com/2') }
  let!(:web3) { create(:website, member: member3, short_url: 'https://ex.com/3') }
  let!(:web4) { create(:website, member: member4, short_url: 'https://ex.com/4') }

  before do
    create(:friendship, from_member: member1, to_member: member2)
    create(:friendship, from_member: member1, to_member: member3)
    create(:friendship, from_member: member4, to_member: member1)
    create(:friendship, from_member: member4, to_member: member2)
  end

  describe 'call' do
    subject { described_class.new.call }

    it 'returns MemberPreview for all members with the correct info' do
      expect(subject).to match_array([
        have_attributes(class: Members::MemberPreview, member_id: member1.id, full_name: 'One', short_url: 'https://ex.com/1', friend_count: 3),
        have_attributes(class: Members::MemberPreview, member_id: member2.id, full_name: 'Two', short_url: 'https://ex.com/2', friend_count: 2),
        have_attributes(class: Members::MemberPreview, member_id: member3.id, full_name: 'Three', short_url: 'https://ex.com/3', friend_count: 1),
        have_attributes(class: Members::MemberPreview, member_id: member4.id, full_name: 'Four', short_url: 'https://ex.com/4', friend_count: 2)
      ])
    end
  end
end
