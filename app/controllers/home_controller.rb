class HomeController < ApplicationController
  def index
    @users = User.all
    @cocktails = Cocktail.all
  end
end
