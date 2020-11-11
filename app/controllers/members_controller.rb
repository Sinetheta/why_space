class MembersController < ApplicationController
  def my_profile
    @member = Member.eager_load(:passions, :websites).find_by(user: current_user)
  end

  def show
    @member = Member.eager_load(:passions, :websites).find(params[:id])
  end
end
