class MembersController < ApplicationController
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
      :websites
    )
  end
end
