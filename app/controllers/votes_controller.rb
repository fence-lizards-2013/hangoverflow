# REVIEW: unimplemented code is evil!
class VotesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    Vote.create(user_id: current_user.id, cocktail_id: params[:cocktail_id], value: 1)
    redirect_to Cocktail.find(params[:cocktail_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
