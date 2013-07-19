class AddDefaultToVoteScore < ActiveRecord::Migration
  def change
  	change_column :cocktails, :vote_score, :integer, default: 0
  end
end
