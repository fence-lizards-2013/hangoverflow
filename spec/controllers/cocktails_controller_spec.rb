require 'spec_helper'

describe CocktailsController do
  let!(:ingredient) {FactoryGirl.create(:ingredient)}
  let!(:cocktail) { ingredient.cocktail }
  let!(:user) { cocktail.user }

  before(:each) do
    sign_in(user)
  end

  describe "visiting the cocktail view page" do
    it "should be successful" do
      get 'show', :id => cocktail.id
      response.should be_success
    end
  end

  describe "Searching for a cocktail" do
    it "an ingredient menu should appear when the user clicks the search by ingredient button" do
      visit '/'
      expect(page).to have_content("Search by Ingredient")
      expect(page).to_not have_content("Vodka")
      click_button("Search by Ingredient")
      expect(page).to have_content("Vodka")
    end

    it "should provide a list of unique possible ingredients"

    it "should go to a search results page when the user clicks on the search button"
  end

end
