require 'rails_helper'

RSpec.describe "Members", type: :request do
  describe "GET /show" do
    let(:member) { create(:member, full_name: 'Special Person') }

    subject { get member_path(member) }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it "displays the member's full name" do
      subject
      expect(response.body).to include('Special Person')
    end
  end
end
