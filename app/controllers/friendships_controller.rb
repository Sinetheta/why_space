class FriendshipsController < ApplicationController
  def create
    Friendship.create!(friendship_params)
    redirect_to my_profile_members_path
  end

  private

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:from_member_id, :to_member_id)
  end
end
