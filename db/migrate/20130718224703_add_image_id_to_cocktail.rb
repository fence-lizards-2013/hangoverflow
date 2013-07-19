class AddImageIdToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :image_id, :string
  end
end