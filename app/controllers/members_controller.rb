class MembersController < ApplicationController
  def index
    @members = Members::AllMemberPreviews.new.call
  end

  def my_profile
    @member = member_profile_page_scope.find_by(user: current_user)
  end

  def show
    @member = member_profile_page_scope.find(params[:id])
  end

  private

  def member_profile_page_scope
    Member.eager_load(
      :passions,
      :websites,
      :from_members,
      :to_members
    )
  end
end
