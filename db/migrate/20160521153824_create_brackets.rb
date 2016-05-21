class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
      t.integer 'tournament_id', null: false
      t.integer 'event_id', null: false
      t.string 'name', null: false, default: ""
      t.integer 'created_by'
      t.integer 'players'
      t.text 'info', default: ""

      t.timestamps null: false
    end
  end
end
