class ProfilesController < ApplicationController

  def index

  end

  def new
  @profile = Profile.new
  end

  def create

  @profile = Profile.new(params_profile)
  @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render 'new'
    end
  end


  private

  def params_profile
    params.require(:profile).permit(:name, :preference)
  end
end
