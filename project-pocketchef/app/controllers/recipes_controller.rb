class RecipesController < ApplicationController

  def index
      @apiPath = 'https://api.edamam.com/search?q='
      @appId = ENV['RECIPE_APP_ID']
      @apiKey = ENV['RECIPE_API_KEY']

      @recipe = params[:search]
      @response = HTTParty.get(@apiPath.to_s + "" + @recipe.to_s  + ""+ @appId.to_s + "" + @apiKey.to_s)
      puts "This is the recipe #{@recipe}"
      @recipeResponse = JSON.parse(@response.body)
      puts @recipeResponse["hits"][0]["recipe"]["label"]
  end

  def create
    # @recipe = params[:search]
    # @apiPath = 'https://api.edamam.com/search?q='
    # @appId = ENV['RECIPE_APP_ID']
    # @apiKey = ENV['RECIPE_API_KEY']
    # @response = HTTParty.get(@apiPath.to_s + "" + @recipe.to_s  + ""+ @appId.to_s + "" + @apiKey.to_s)
    # puts "Recipe is #{@recipe}"
    redirect_to recipes_path(:search => params[:search])
  end
end
