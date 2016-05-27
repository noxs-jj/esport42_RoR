class Backoffice::BracketController < Backoffice::ApplicationController
  include BracketHelper
  include CellHelper
  include ParticipantHelper
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
        @participants = []
        @paricipants = participant_help_bracket_tournament_list(@tournament.id)
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

  def edit_cell
    @bracket = Bracket.find_by(id: params[:id])
    if @bracket.nil?
      redirect_to backoffice_bracket_index_path, alert: "Bracket #{params[:id].to_s} doesn't exist"
    else
      @tournament = Tournament.find_by(id: @bracket.tournament_id)
      if @tournament.nil?
        redirect_to backoffice_bracket_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist on Bracket #{params[:id].to_s}"
      else
        @participants = []
        @participants = participant_help_bracket_tournament_list(@tournament.id)
        @cells = get_cells_if_bracket(params[:id])
        @participant_collection = participant_help_collection_participant_name_id(@participants)
      end
    end
  end

  def update_cell
    bracket = Bracket.find_by(id: params[:id])
    if bracket.nil? && bracket.cell_populated == false
      redirect_to request.headers["HTTP_REFERER"], alert: "Bracket #{params[:id]} doesn't exist"
    else
      if bracket.cell_populated == false
        redirect_to request.headers["HTTP_REFERER"], alert: "Bracket #{params[:id]} need to be populated"
      else
        i = 1
        @cells = get_cells_if_bracket(params[:id])
        data_param = params[:cellules]
        while i - 1 < (data_param.length / 2)
          cell = Cell.find_by( bracket_id: params[:id], slot_id_cell_in_bracket: i )
          tmp1 = "slot_#{i  * 2 - 1}"
          tmp2 = "slot_#{i * 2}"
          cell.update_attributes(participant_1_id: data_param[tmp1].to_i) if data_param[tmp1].to_i != -1
          cell.update_attributes(participant_2_id: data_param[tmp2].to_i) if data_param[tmp2].to_i != -1
          i += 1
        end
        redirect_to request.headers["HTTP_REFERER"], notice: "Update Success"
      end
    end
  end

private
  def bracket_params
    params.require(:bracket).permit( :name, :tournament_id, :players, :info )
  end
end
