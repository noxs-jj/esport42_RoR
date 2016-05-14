class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :organizer, :boolean, default: false
    add_column :users, :referee, :boolean, default: false
    add_column :users, :volunteer, :boolean, default: false
  end
end
