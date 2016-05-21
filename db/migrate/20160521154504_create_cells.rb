class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.integer 'tournament_id'
      t.integer 'event_id'
      t.integer 'bracket_id'
      t.integer 'slot_id_cell_in_bracket'
      t.integer 'seed_id_parent_openent_1'
      t.integer 'participant_1_id'
      t.integer 'score_1'
      t.integer 'seed_id_parent_openent_2'
      t.integer 'participant_2_id'
      t.integer 'score_2'
      t.datetime 'scheduled'
      t.integer 'winner_participant_id'
      t.integer 'cell_id_son'
      t.integer 'updated_by'
      t.text 'info'

      t.timestamps null: false
    end
  end
end
