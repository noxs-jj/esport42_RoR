class CreateCellStatuses < ActiveRecord::Migration
  def change
    create_table :cell_statuses do |t|
      t.string 'name', null: false, default: ""

      t.timestamps null: false
    end
  end
end
