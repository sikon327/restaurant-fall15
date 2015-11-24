class AddUserRefToRestaurants < ActiveRecord::Migration
  def change
  	add_reference :restaurants, :user, index: true, foreign_key: true
  	remove_reference :restaurants, :owner
  end
end
