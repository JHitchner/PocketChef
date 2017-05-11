class RecipesController < ApplicationController

  def index
      @apiPath = 'https://api.edamam.com/search?q='
      @appId = ENV['RECIPE_APP_ID']
      @apiKey = ENV['RECIPE_API_KEY']

      @recipe = params[:search]
      @response = HTTParty.get(@apiPath.to_s + "" + @recipe.to_s  + ""+ @appId.to_s + "" + @apiKey.to_s)
      @recipeResponse = JSON.parse(@response.body)
  end
  def new
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
  end
  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
  private
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients)
    end
end
