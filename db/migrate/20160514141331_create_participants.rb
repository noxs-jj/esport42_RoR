class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer 'user_id', null: false
      t.integer 'event_id', null: false
      t.integer 'type_id', null: false
      t.integer 'status_id', null: false
      t.integer 'tournament_ids', array: true, default: []

      t.timestamps null: false
    end
  end
end
