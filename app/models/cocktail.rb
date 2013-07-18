class Cocktail < ActiveRecord::Base
  attr_accessible :description, :instructions, :name, :ingredients_attributes, :user_id
  has_many :ingredients
  belongs_to :user
  has_many :votes

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  def update_vote_score!(value)
  	vote_score += value
  	vote_score.save
  end
end
