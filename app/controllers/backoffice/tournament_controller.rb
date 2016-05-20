class Backoffice::TournamentController < Backoffice::ApplicationController
  load_and_authorize_resource

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
    tournament.created_by = current_user.id
    tournament.save
    if tournament
      redirect_to backoffice_user_show_path(tournament.id), notice: "Tournament created success"
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Failed to create Tournament, plz contact admin"
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
    if @tournament.nil?
      redirect_to backoffice_tournament_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
    else
      if @tournament.update(tournament_params)
        redirect_to backoffice_tournament_show_path(@tournament.id), notice: "Update success"
      else
        redirect_to backoffice_tournament_index_path, alert: "Failed to update tournament."
      end
    end
  end

private
  def tournament_params
    params.require(:tournament).permit(
      :name, :game_id, :event_id, :participant_ids, :max_players,
      :rules, :brackets_info, :other_info
    )
  end
end
