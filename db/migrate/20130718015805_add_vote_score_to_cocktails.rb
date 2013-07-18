class AddVoteScoreToCocktails < ActiveRecord::Migration
  def change
  	add_column :cocktails, :vote_score, :integer
  end
end
