class TournamentController < ApplicationController
  include TournamentHelper
  include BracketHelper
  include ParticipantHelper
  load_and_authorize_resource

  def index
  end

  def show
    @tournament = Tournament.find_by(id: params[:id])
    if @tournament.nil?
      redirect_to tournament_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist"
    else
      @participants = participantHelper_list_participants_from_event_id(@tournament.id)
      @brackets = bracketHelper_list_brackets_from_tournament_id(@tournament.id)
    end
  end
end
