class AddOwnerToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :owner, :string
  end
end
