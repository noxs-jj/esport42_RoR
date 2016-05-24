class AddCellPopulatedToBracket < ActiveRecord::Migration
  def change
    add_column :brackets, :cell_populated, :boolean, default: false
  end
end
