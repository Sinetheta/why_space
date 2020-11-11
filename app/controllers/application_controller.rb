class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    my_profile_members_path
  end
end
