require 'spec_helper'

describe CocktailsController do

  let!(:cocktail) { FactoryGirl.create(:cocktail) }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => cocktail.id
      response.should be_success
    end
  end

end
