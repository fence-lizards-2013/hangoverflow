require 'spec_helper'

describe CocktailsController do

  let!(:cocktail) { FactoryGirl.build(:cocktail) }

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
