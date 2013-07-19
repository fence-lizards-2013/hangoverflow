class HomeController < ApplicationController
  def index
    @users = User.all
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
  end
end
