class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
    @cocktail.ingredients << Ingredient.new
    @cocktail.ingredients << Ingredient.new
    @cocktail.ingredients << Ingredient.new
  end

  def create
    @cocktail = Cocktail.new params[:cocktail]
    p @cocktail
    p @cocktail.ingredients.first
    # params[:ingredients].each do |ingredient|
    #   @cocktail.ingredients.build ingredient
    # end    
  end

  def edit
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
