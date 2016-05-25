class Backoffice::BracketController < Backoffice::ApplicationController
  include BracketHelper
  include CellHelper
  load_and_authorize_resource

  def index
    @brackets = Bracket.all.order(created_at: :desc)
  end

  def show
    @bracket = Bracket.find_by(id: params[:id])
    if @bracket.nil?
      redirect_to backoffice_bracket_index_path, alert: "Bracket #{params[:id].to_s} doesn't exist"
    else
      @tournament = Tournament.find_by(id: @bracket.tournament_id)
      if @tournament.nil?
        redirect_to backoffice_bracket_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist on Bracket #{params[:id].to_s}"
      else
        @cells = get_cells_if_bracket(params[:id])
      end
    end
  end

  def new
    @bracket = Bracket.new
  end

  def create
    bracket = Bracket.new(bracket_params)
    bracket.created_by = current_user.id
    bracket.event_id = bracket.find_event_id_with_tournament_id
    bracket.save
    if bracket
      redirect_to  backoffice_bracket_show_path(bracket.id), notice: "Register success"
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Register failed, plz contact admin"
    end
  end

  def edit
    @bracket = Bracket.find(params[:id])
    if @bracket.nil?
      redirect_to backoffice_bracket_index_path, alert: "Bracket #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @bracket = Bracket.find(params[:id])

    if @bracket.nil?
      redirect_to backoffice_bracket_index_path, alert: "Bracket #{params[:id].to_s} doesn't exist"
    else
      if @bracket.update(bracket_params)
        redirect_to backoffice_bracket_show_path(@bracket.id), notice: "Update success"
      else
        redirect_to backoffice_bracket_index_path, alert: "Failed to update event."
      end
    end
  end

private
  def bracket_params
    params.require(:bracket).permit( :name, :tournament_id, :players, :info )
  end
end
