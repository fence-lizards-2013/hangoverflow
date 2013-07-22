class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all.sample(30)
    @ingredients = Ingredient.unique_ingredient_names.sort
  end
end
