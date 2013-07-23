class VotesController < ApplicationController
  def create
    Vote.create(user_id: current_user.id, cocktail_id: params[:cocktail_id], value: 1)
    redirect_to Cocktail.find(params[:cocktail_id])
  end
end
