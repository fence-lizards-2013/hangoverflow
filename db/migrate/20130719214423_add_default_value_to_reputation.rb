class AddDefaultValueToReputation < ActiveRecord::Migration
  def change
  	change_column :users, :reputation, :integer, default: 0
  end
end
