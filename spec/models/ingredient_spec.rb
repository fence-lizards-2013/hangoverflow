require 'spec_helper'

describe Ingredient do
  
  let(:ingredient) { FactoryGirl.create(:ingredient) }

  context "Validations" do

    it "should be invalid without name" do 
      should validate_presence_of(:name)
    end

    it "should be invalid without quantity" do 
      should validate_presence_of(:quantity)
    end

    it "should be invalid without unit of measurement" do 
      should validate_presence_of(:unit_of_measurement)
    end

    it "should be invalid without user" do
      ingredient.cocktail = nil
      expect(ingredient).to be_invalid
    end
  end
end
