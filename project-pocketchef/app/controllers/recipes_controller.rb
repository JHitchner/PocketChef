class RecipesController < ApplicationController

  def index
      @apiPath = 'https://api.edamam.com/search?q='
      @appId = ENV['RECIPE_APP_ID']
      @apiKey = ENV['RECIPE_API_KEY']

      @recipe = params[:search]
      @response = HTTParty.get(@apiPath.to_s + "" + @recipe.to_s  + ""+ @appId.to_s + "" + @apiKey.to_s)
      @recipeResponse = JSON.parse(@response.body)
  end

  def create

  end

end
