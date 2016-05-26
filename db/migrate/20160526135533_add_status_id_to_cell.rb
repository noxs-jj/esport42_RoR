class AddStatusIdToCell < ActiveRecord::Migration
  def change
    add_column :cells, :status_id, :integer, default: 1
  end
end
