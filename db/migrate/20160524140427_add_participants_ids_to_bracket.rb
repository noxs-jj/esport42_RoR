class AddParticipantsIdsToBracket < ActiveRecord::Migration
  def change
    add_column :tournaments, :participant_1_id, :integer, array: true, default: []
  end
end
