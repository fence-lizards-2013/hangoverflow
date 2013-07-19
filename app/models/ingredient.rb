class Ingredient < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit_of_measurement

  validates :name, :quantity, :unit_of_measurement, presence: true

  belongs_to :cocktail
end
