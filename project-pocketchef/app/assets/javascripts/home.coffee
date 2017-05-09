# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var subButton = document.getElementById("submit");
var searchField = document.getElementById("search");

var apiPath = 'https://api.edamam.com/search?q=';
var appId = '&5d51289d';
var apiKey = '&fdbd4c19d29dd73cbd5a56f54a7e7bfd';



function recipeGenerate(){
    var url = apiPath + searchField.value + appId+ apiKey;
    console.log(url)
    console.log(url.recipe[])
}

 subButton.addEventListener("click", function(){
    console.log("I have been clicked")
    recipeGenerate();
  })
