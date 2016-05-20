class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|

      t.string 'name', null: false, default: ""
      t.string 'game_id', default: ""
      t.string 'event_id', null:false, default: ""
      t.integer 'participant_ids', array: true, default: []
      t.integer 'max_players', default: 0
      t.integer 'created_by', null: false
      t.text 'rules', default: ""
      t.text 'brackets_info', default: ""
      t.text 'other_info', default: ""

      t.timestamps null: false
    end
  end
end
