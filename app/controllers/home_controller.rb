class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.unique_ingredient_names.sort
  end
end
