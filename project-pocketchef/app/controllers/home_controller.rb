class HomeController < ApplicationController

  def index
    @apiPath = 'https://api.edamam.com/search?q='
    @appId = ENV['RECIPE_APP_ID']
    @apiKey = ENV['RECIPE_API_KEY']
    @recipe = params[:search] || "chicken"
    @response = HTTParty.get(@apiPath.to_s + "" + @recipe.to_s  + "" + @appId.to_s + "" + @apiKey.to_s + "&from=0" + "&to=10")
    @recipeResponse = JSON.parse(@response.body)
  end
end
