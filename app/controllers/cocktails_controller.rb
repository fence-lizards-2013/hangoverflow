class CocktailsController < ApplicationController

  def index 
    @cocktails = Cocktail.all
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

    selected_ingredients = find_ingredient_obj_by_name(selected_ingredient_names)

    cocktail_id_numbers = find_cocktail_ids_by_ingredients(selected_ingredients)

    @cocktails = Cocktail.find(cocktail_id_numbers)
    @ingredients = Ingredient.unique_ingredient_names.sort

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

  def find_ingredient_obj_by_name(selected_ingredient_names)
    selected_ingredients = []

    selected_ingredient_names.each do |name|
      selected_ingredients << Ingredient.find_all_by_name(name)
    end
    selected_ingredients.flatten!
  end

  def find_cocktail_ids_by_ingredients(selected_ingredients)
    cocktail_id_numbers = []

    selected_ingredients.each do |ingredient|
      cocktail_id_numbers << ingredient.cocktail_id unless cocktail_id_numbers.include?(ingredient.cocktail_id)
    end
    cocktail_id_numbers
  end
end
