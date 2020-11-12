require 'rails_helper'

RSpec.describe Searches::FindPath, type: :model do
  let(:from_member_id) { 1 }
  let(:to_member_id) { 4 }
  let(:friendship_graph) {[
      [1, 2, 1],
      [2, 3, 1],
      [3, 4, 1],

      [1, 3, 1],

      [5, 6, 1]
    ]}
  let(:path_finder) {
    described_class.new(from_member_id, to_member_id, friendship_graph)
  }

  describe 'call' do
    subject { path_finder.call }

    it 'returns the shortest path' do
      expect(subject).to eq([1, 3, 4])
    end

    context 'to a node with no path' do
      let(:to_member_id) { 5 }

      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end
  end
end
