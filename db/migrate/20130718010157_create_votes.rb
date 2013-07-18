class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :value
  		t.references :cocktail 
  		t.references :user
  	end
  end
end
