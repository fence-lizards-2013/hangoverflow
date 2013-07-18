class Cocktail < ActiveRecord::Base
  attr_accessible :description, :instructions, :name, :ingredients_attributes, :user_id
  has_many :ingredients
  has_many :votes
  belongs_to :user

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  def update_vote_score!(value)
  	vote_score += value
  	vote_score.save
  end
end
