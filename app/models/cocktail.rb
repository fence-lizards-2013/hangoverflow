class Cocktail < ActiveRecord::Base
  attr_accessible :description, :instructions, :name, :ingredients_attributes, :user_id, :vote_score
  has_many :ingredients, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  def update_vote_score!(value)
  	self.vote_score += value
  	self.save
  end
end
