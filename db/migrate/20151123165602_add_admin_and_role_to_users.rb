class AddAdminAndRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :role, :string, default: "patron"
  end
end
