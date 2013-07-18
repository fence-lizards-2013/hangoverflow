class CocktailsController < ApplicationController

  def index 
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.create params[:cocktail]
    redirect_to @cocktail
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
