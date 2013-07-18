class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    render :json => render_to_string(partial: 'cocktails/ingredient', :locals => { :ingredient => @ingredient }).to_json
  end
end
