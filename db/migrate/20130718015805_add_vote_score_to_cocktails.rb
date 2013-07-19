class AddVoteScoreToCocktails < ActiveRecord::Migration
  def change
  	add_column :cocktails, :vote_score, :integer, default: 0
  end
end
