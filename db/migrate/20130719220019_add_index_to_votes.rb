class AddIndexToVotes < ActiveRecord::Migration
  def change
  	add_index :votes, [:user_id, :cocktail_id], :unique => true
  end
end
