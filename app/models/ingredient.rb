class Ingredient < ActiveRecord::Base
  attr_accessible :name, :quantity, :unitofmeasurement
  belongs_to :cocktail
end
