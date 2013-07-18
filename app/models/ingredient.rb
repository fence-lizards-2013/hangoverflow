class Ingredient < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit_of_measurement
  belongs_to :cocktail
end
