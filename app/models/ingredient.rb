class Ingredient < ActiveRecord::Base

  attr_accessible :name, :quantity, :unit_of_measurement

  validates :name, :quantity, :unit_of_measurement, :cocktail, presence: true

  belongs_to :cocktail, inverse_of: :ingredients
  
  UNITS = ['part','oz','cup','ml','tsp','Tbs']
  
  def self.unique_ingredient_names
    self.pluck(:name).uniq
  end

end
