class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.create params[:cocktail]
    redirect @cocktail
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
