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
    @cocktail = current_user.cocktails.build params[:cocktail]
      if params[:cocktail][:image_id].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:cocktail][:image_id])         
      raise "Invalid upload signature" if !preloaded.valid?
        @cocktail.image_id = preloaded.identifier
      end
      @cocktail.save
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
    selected_ingredients = []
    params[:parameters].each do |k, v|
      selected_ingredients << k if v == "1"
    end

    non_selected_ingredients.each
      @cocktails = Ingredient.find_by_name()


    
  end
end
