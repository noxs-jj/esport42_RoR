class BracketController < ApplicationController
  include TournamentHelper
  include BracketHelper
  include ParticipantHelper
  include CellHelper
  load_and_authorize_resource

  def index
  end

  def show
    @bracket = Bracket.find_by(id: params[:id])
    if @bracket.nil?
      redirect_to bracket_index_path, alert: "Bracket #{params[:id].to_s} doesn't exist"
    else
      @tournament = Tournament.find_by(id: @bracket.tournament_id)
      if @tournament.nil?
        redirect_to bracket_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist on Bracket #{params[:id].to_s}"
      else
        @participants = []
        @paricipants = participant_help_bracket_tournament_list(@tournament.id)
        @cells = get_cells_if_bracket(params[:id])
      end
    end
  end
end
