class CocktailsController < ApplicationController

  def index 
    @cocktails = Cocktail.where(ingredient_attributes: params)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.create params[:cocktail]
    redirect_to @cocktail
  end

  def edit
    @cocktail.find(params[:id])
  end

  def update
  end

  def destroy
    Cocktail.destroy(params[:id])
    render :nothing => true
  end

  def search
    non_selected_ingredients = []
    params[:parameters].each do |k, v|
      non_selected_ingredients << k if v == 0
    end
    non_selected_ingredients.each
    @cocktails = Ingredient.find_by_name()


    
  end
end
