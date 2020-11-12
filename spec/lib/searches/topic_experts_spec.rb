require 'rails_helper'

RSpec.describe Searches::TopicExperts, type: :model do
  let!(:cat_expert) { create(:member, passion_topics: ['Cat things']) }
  let!(:dog_expert) { create(:member, passion_topics: ['Dog stuff']) }
  let!(:cats_and_dogs) { create(:member, passion_topics: ['Cats and Dogs']) }
  let!(:excluded) { create(:member, passion_topics: ['Cats and Dogs']) }

  let(:topic) { 'cat' }
  let(:excluded_member_ids) { [excluded.id] }

  let(:topic_experts) { described_class.new(topic, excluded_member_ids) }

  describe 'call' do
    subject { topic_experts.call }

    it 'returns Experts with a Passion for the given topic' do
      expect(subject).to match_array([
        have_attributes(class: Searches::Expert, member_id: cat_expert.id, topic: 'Cat things'),
        have_attributes(class: Searches::Expert, member_id: cats_and_dogs.id, topic: 'Cats and Dogs')
      ])
    end
  end
end
