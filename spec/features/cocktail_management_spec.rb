require 'spec_helper'

feature "Cocktail management", :js => true do 
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    login(user)
  end

  # before :each do
  #   visit new_user_session_path
  #   fill_in "Email", :with => user.email
  #   fill_in "Password", :with => user.password
  #   click_button "Sign in"
  # end


  scenario "User adds ingredient to cocktail" do
    visit new_cocktail_path 

    fill_in "Name", :with => "Flizzerlicious"
    fill_in "Description", :with => "A shot of 151, A shot of Absinthe, 1 oz of real burning alcohol"
    fill_in "Instructions", :with => "Light it up! Stir with ass out"
    click_link "Add Ingredient"

    expect(page).to have_text("Quantity")
    expect(page).to have_text("Unit of measurement")
    within('form.new_cocktail fieldset') do
      fill_in "Name", :with => "Stuff"
      fill_in "Quantity", :with => "2"
      fill_in "Unit of measurement", :with => "1oz"
    end

    click_button "Create Cocktail"
    expect(page).to have_text("Your cocktail")

  end
end
