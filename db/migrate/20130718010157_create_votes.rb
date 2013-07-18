class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :value
  		t.integer :cocktail_id
  		t.integer :user_id

  		t.references :cocktail 
  		t.references :user
  	end
  end
end
