class MemberController < ApplicationController
  def my_profile
    @member = Member.find_by(user: current_user)
  end

  def show
    @member = Member.find(params[:id])
  end
end
