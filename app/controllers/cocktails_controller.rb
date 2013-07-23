class CocktailsController < ApplicationController

  def index 
    @cocktails = Cocktail.all.sample(30)
    @ingredients = @ingredients = Ingredient.unique_ingredient_names.sort
    render :json => render_to_string(@cocktails).to_json
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.build params[:cocktail]
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update_attributes(params[:cocktail])
      redirect_to @cocktail
    else
      render :edit
    end
  end

  def destroy
    Cocktail.destroy(params[:id])
    render :nothing => true
  end

  def search
    selected_ingredient_names = parse_search_form_input(params)
    @cocktails = Ingredient.where("name in (?)", selected_ingredient_names).map do |i|
      i.cocktail
    end.uniq

    render :json => render_to_string(@cocktails).to_json
  end

  private
  #search helper methods

  def parse_search_form_input(params)
    selected_ingredient_names = []

    params[:parameters].each do |k, v|
      selected_ingredient_names << k if v == "1"
    end
    selected_ingredient_names
  end

end
