require 'spec_helper'

describe Cocktail do

  let(:cocktail) { FactoryGirl.create(:cocktail) }
  let(:user) { cocktail.user }

  context "Validations" do

    it "should be invalid without name" do 
      cocktail.name = nil
      expect(cocktail).to be_invalid
    end

    it "should be invalid without description" do 
      cocktail.description = nil
      expect(cocktail).to be_invalid
    end
    
    it "should be invalid without instructions" do 
      cocktail.instructions = nil
      expect(cocktail).to be_invalid
    end

    it "should be invalid without user" do
      cocktail.user = nil
      expect(cocktail).to be_invalid
    end
  end

  context "Associations" do
    
    subject { cocktail }

    it "should belong_to user" do
      should belong_to :user
    end

    it "should have many votes" do 
      should have_many :votes
    end

    it "should have many ingredients" do 
      should have_many :ingredients
    end
  end

  context "Nested Ingredients" do
    subject { cocktail }

    it "should accept nested attr for ingredient" do
      should accept_nested_attributes_for(:ingredients)
    end
  end

  context "#update_vote_score!" do

    it "should update the vote_score value" do
      expect {
        cocktail.update_vote_score!(1)
      }.to change { cocktail.vote_score }.by(1)
    end
  end

end
