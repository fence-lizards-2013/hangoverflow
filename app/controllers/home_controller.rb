class HomeController < ApplicationController
  def index
    @ingredients = Ingredient.unique_ingredient_names.sort
  end
end
