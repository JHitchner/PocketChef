class HomeController < ApplicationController

  def index
    @apiPath = 'https://api.edamam.com/search?q='
    @appId = ENV['RECIPE_APP_ID']
    @apiKey = ENV['RECIPE_API_KEY']

    @recipe = params[:search]
    @fullQuery = @apiPath.to_s + "" + @recipe.to_s  + "&api_id="+ @appId.to_s + "&api_key=" + @apiKey.to_s + "&from=0" + "&to=5"


    @response = HTTParty.get(@fullQuery)
    puts "yo dawg this is my query", @fullQuery
    @recipeResponse = JSON.parse(@response.body)
    puts "yo dawg this is my JSON response", @recipeResponse.inspect
  end
end
