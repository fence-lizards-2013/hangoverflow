class Cocktail < ActiveRecord::Base
  attr_accessible :description, :instructions, :name, :ingredients_attributes
  has_many :ingredients
  belongs_to :user
  has_many :votes

  accepts_nested_attributes_for :ingredients 

  def update_vote_score!(value)
  	vote_score += value
  	vote_score.save
  end
end
