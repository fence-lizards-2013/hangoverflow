class HomeController < ApplicationController
  def index
    @users = User.all
    @cocktails = Cocktail.all
    @ingredients = unique_ingredient_names
  end

  private
  
  def unique_ingredient_names
    ingredients = []
    Ingredient.all.each do |ingredient|
      ingredients << ingredient.name
    end
    ingredients.uniq
  end
end
