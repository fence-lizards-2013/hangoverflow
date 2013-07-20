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
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
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
    p "*" * 50
    selected_ingredient_names = parse_search_form_input(params)
    p selected_ingredient_names

    selected_ingredients = find_ingredient_obj_by_name(selected_ingredient_names)
    p "*" * 50
    p selected_ingredients

    cocktail_id_numbers = find_cocktail_ids_by_ingredients(selected_ingredients)
    p "*" * 50
    p cocktail_id_numbers

    @cocktails = Cocktail.find(cocktail_id_numbers)
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
