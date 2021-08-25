class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, null: false
    rename_column(:users, :name, :first_name)
    add_column(:users, :last_name, :string)
  end
end
