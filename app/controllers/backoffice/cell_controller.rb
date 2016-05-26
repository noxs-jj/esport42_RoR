class Backoffice::CellController < Backoffice::ApplicationController
  include BracketHelper
  include CellHelper
  load_and_authorize_resource

  def show
  end

  def edit
    @cell = Cell.find_by(id: params[:id])
  end

  def update
    @cell = Cell.find_by(id: params[:id])
    if @cell.nil?
      redirect_to request.headers["HTTP_REFERER"], alert: "Cell/Match #{params[:id]} doesn't exist"
    else
      if @cell.update(cell_match_edit_params)
        redirect_to request.headers["HTTP_REFERER"], notice: "Cell/Match #{params[:id]} Update success"
      else
        redirect_to request.headers["HTTP_REFERER"], alert: "Cell/Match #{params[:id]} Faled to update"
      end
    end
  end

  def populate_bracket
    bracket = Bracket.find_by(id: params[:bracket_id])
    if bracket.nil?
      redirect_to request.headers["HTTP_REFERER"], alert: "Bracket #{params[:bracket]} doesn't exist"
    else
      cells = Cell.where(bracket_id: bracket.id).all
      if cells.count != 0
          redirect_to request.headers["HTTP_REFERER"], alert: "Cells already generated for bracket #{bracket.id}"
      else
        tournament = Tournament.find_by(id: bracket.tournament_id)
        if tournament.nil?
          redirect_to request.headers["HTTP_REFERER"], alert: "Tournament #{bracket.tournament_id} doesn't exist on bracket #{bracket.id}"
        else
          event = Event.find_by(id: bracket.event_id)
          if cells.nil?
            redirect_to request.headers["HTTP_REFERER"], alert: "Event #{bracket.event_id} doesn't exist on bracket #{bracket.id}"
          else
            i = 0
            bracket_size = bracketHelper_number_cell_with_number_participants(bracket.players)
            @generated_cells = []
            while i < bracket_size
              new_cell = Cell.new(
                tournament_id: bracket.tournament_id,
                event_id: bracket.event_id,
                bracket_id: bracket.id,
                slot_id_cell_in_bracket: i + 1,
                seed_id_parent_openent_1: -1,
                participant_1_id: -1,
                score_1: 0,
                seed_id_parent_openent_2: -1,
                participant_2_id: -1,
                score_2: 0,
                scheduled: Time.now,
                winner_participant_id: -1,
                cell_id_son: -1,
                updated_by: current_user.id,
                info: ""
              )
              i += 1
              new_cell.save
              @generated_cells << new_cell
            end
          end
        end
      end
    end
  end

  def son_fillit
    ap "DEB 0"
    @cells = Cell.where(bracket_id: params[:bracket_id]).all
    ap "DEB 1"
    ap @cells.length + 1
    cellHelper_fill_parent_and_son_id(@cells.length + 1, @cells)
    ap "DEB 2"
    redirect_to request.headers["HTTP_REFERER"], notice: "Son fillit !"
  end

  def bracket_cells
    @cells = Cell.where(bracket_id: params[:bracket_id]).order(slot_id_cell_in_bracket: :asc).paginate(page: params[:page])
  end

private
  def cell_match_edit_params
    params.require(:cell).permit( :score_1, :score_2, :scheduled, :winner_participant_id, :info, :status_id )
  end
end
