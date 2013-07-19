class CocktailsController < ApplicationController

  def index 
    @cocktails = Cocktail.all
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

end
