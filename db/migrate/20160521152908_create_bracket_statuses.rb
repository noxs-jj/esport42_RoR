class CreateBracketStatuses < ActiveRecord::Migration
  def change
    create_table :bracket_statuses do |t|
      t.string 'name', null: false, default: ""

      t.timestamps null: false
    end
  end
end
