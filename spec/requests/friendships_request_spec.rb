require 'rails_helper'

RSpec.describe "Friendships", type: :request do
  describe "POST /create" do
    let!(:from_member) { create(:member) }
    let!(:to_member) { create(:member) }
    let(:friendship_params) { {
      friendship: {
        from_member_id: from_member.id,
        to_member_id: to_member.id
      }
    } }

    subject { post friendships_path, params: friendship_params }

    it "creates a new friendship between these members" do
      expect{ subject }.to change{ from_member.reload.friends }.
        from([]).
        to([to_member])
    end

    it "redirects to my profile" do
      expect(subject).to redirect_to(my_profile_members_path)
    end
  end
end
