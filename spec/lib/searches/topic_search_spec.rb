require 'rails_helper'

RSpec.describe Searches::TopicSearch, type: :model do
  let!(:member) { create(:member) }
  let!(:popular_member) { create(:member) }

  let!(:cat_expert) { create(:member, passion_topics: ['Cat things']) }
  let!(:dog_expert) { create(:member, passion_topics: ['Dog stuff']) }
  let!(:cats_and_dogs) { create(:member, passion_topics: ['Cats and Dogs']) }
  let!(:unpopular) { create(:member, passion_topics: ['Cats and Dogs']) }

  before do
    create(:friendship, from_member: popular_member, to_member: member)
    create(:friendship, from_member: popular_member, to_member: cat_expert)
    create(:friendship, from_member: popular_member, to_member: dog_expert)
    create(:friendship, from_member: popular_member, to_member: cats_and_dogs)
  end

  let(:topic) { 'cat' }
  let(:topic_search) { described_class.new(topic, member.id) }

  describe 'call' do
    subject { topic_search.call }

    it 'returns a path of Introduction from the member to each connected expert' do
      expect(subject).to match_array([
        have_attributes(
          class: Searches::Introduction,
          members: match_array([
            have_attributes(class: Member, id: member.id),
            have_attributes(class: Member, id: popular_member.id),
            have_attributes(class: Member, id: cat_expert.id)
          ]),
          topic: 'Cat things'
        ),
        have_attributes(
          class: Searches::Introduction,
          members: match_array([
            have_attributes(class: Member, id: member.id),
            have_attributes(class: Member, id: popular_member.id),
            have_attributes(class: Member, id: cats_and_dogs.id)
          ]),
          topic: 'Cats and Dogs'
        ),
      ])
    end
  end
end
