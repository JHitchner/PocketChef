class RegistrationsController < ApplicationController

  def after_inactive_sign_up_path_for(resource)
       new_profile_path
  end


end
