class AddTournamentStatusToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :tournament_status, :integer, default: 1
  end
end
