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

  def show
    if(Profile.exists?(current_user.id))
      @profile = Profile.find(params[:id])
    else redirect_to new_profile_path
    end
    #  @profile = Profile.find(params[:id])
     @recipe = Recipe.all
     @apiPath = 'https://api.edamam.com/search?q='
     @appId = ENV['RECIPE_APP_ID']
     @apiKey = ENV['RECIPE_API_KEY']

     @response = HTTParty.get(@apiPath.to_s + "" + @recipe_pref.to_s  + ""+ @appId.to_s + "" + @apiKey.to_s + "&from=0" + "&to=5")
     @recipeResponse = JSON.parse(@response.body)
     @recipe_pref = params[:search] || params[:preference]
  end


  private

  def params_profile
    params.require(:profile).permit(:name, :preference, {:user_id => [current_user.id]})
  end
end
