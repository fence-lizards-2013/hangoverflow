class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :description
      t.string :instructions
      t.references :user

      t.timestamps
    end
  end
end
