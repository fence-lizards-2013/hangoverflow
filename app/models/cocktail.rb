class Cocktail < ActiveRecord::Base
  attr_accessible :description, :instructions, :name
  has_many :ingredients
  belongs_to :user
  has_many :votes
  
end
