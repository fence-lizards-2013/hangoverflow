class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :unit_of_measurement
      t.references :cocktail

      t.timestamps
    end
  end
end
