require 'rails_helper'

RSpec.describe Searches::GraphFriends, type: :model do
  let!(:member1) { create(:member) }
  let!(:member2) { create(:member) }
  let!(:member3) { create(:member) }
  let!(:friendless) { create(:member) }

  before do
    create(:friendship, from_member: member1, to_member: member2)
    create(:friendship, from_member: member1, to_member: member3)
    create(:friendship, from_member: member2, to_member: member3)
  end

  describe 'call' do
    subject { described_class.new.call }

    it 'returns a graph of all friendships with equal weight 1' do
      expect(subject).to contain_exactly(
        [member1.id, member2.id, 1],
        [member2.id, member1.id, 1],
        [member1.id, member3.id, 1],
        [member3.id, member1.id, 1],
        [member2.id, member3.id, 1],
        [member3.id, member2.id, 1]
      )
    end
  end
end
