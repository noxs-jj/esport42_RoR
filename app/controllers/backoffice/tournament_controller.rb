class Backoffice::TournamentController < Backoffice::ApplicationController
  include TournamentHelper
  include BracketHelper
  load_and_authorize_resource

  def bracket_show
    @tournament = Tournament.find_by(id: params[:id])
    if @tournament.nil?
      redirect_to request.headers["HTTP_REFERER"], alert: "tournament #{params[:id].to_s} doesn't exist"
    else
      @bracket_column = bracketHelper_number_column_with_number_participants(@tournament.max_players)
      @bracket_cell = bracketHelper_number_cell_with_number_participants(@tournament.max_players)
    end
  end

  def index
    @tournaments = Tournament.all.order(created_at: :desc)
  end

  def show
    @tournament = Tournament.find_by(id: params[:id])
    if @tournament.nil?
      redirect_to backoffice_tournament_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist"
    end
  end

  def new
    @tournament = Tournament.new
  end

  def create
    tournament = Tournament.new(tournament_params)
    if tournamentHelper_is_event_can_create_tournament?(tournament.event_id) == true
      tournament.created_by = current_user.id
      tournament.save
      if tournament
        redirect_to backoffice_user_show_path(tournament.id), notice: "Tournament created success"
      else
        redirect_to request.headers["HTTP_REFERER"], alert: "Failed to create Tournament, plz contact admin"
      end
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Can't to create Tournament, the event isn't registrable/pending/open"
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
    if @tournament.nil?
      redirect_to backoffice_tournament_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if tournamentHelper_is_event_can_create_tournament?(@tournament.event_id) == true
      if @tournament.nil?
        redirect_to backoffice_tournament_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
      else
        if @tournament.update(tournament_params)
          redirect_to backoffice_tournament_show_path(@tournament.id), notice: "Update success"
        else
          redirect_to backoffice_tournament_index_path, alert: "Failed to update tournament."
        end
      end
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Can't to update Tournament, the event isn't registrable/pending/open"
    end
  end

private
  def tournament_params
    params.require(:tournament).permit(
      :name, :game_id, :event_id, :participant_ids, :max_players,
      :tournament_status, :rules, :brackets_info, :other_info
    )
  end
end
