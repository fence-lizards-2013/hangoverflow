class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :unitofmeasurement
      t.references :cocktail
      t.references :user
      t.references :votes

      t.timestamps
    end
  end
end
