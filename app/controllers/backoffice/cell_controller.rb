class Backoffice::CellController < Backoffice::ApplicationController
  include BracketHelper
  include CellHelper
  load_and_authorize_resource

  def set_winner
    current_cell = Cell.find_by(id: params[:id])
    winner_participant = Participant.find_by(id: params[:participant_id])
    if current_cell.nil?
      redirect_to request.headers["HTTP_REFERER"], alert: "Cell/Match #{params[:id]} doesn't exist"
    elsif winner_participant.nil?
      redirect_to request.headers["HTTP_REFERER"], alert: "Participant #{params[:participant_id]} doesn't exist"
    else
      if -1337 == current_cell.cell_id_son
        current_cell.winner_participant_id = winner_participant.id
        current_cell.save
        redirect_to  backoffice_bracket_show_path(current_cell.bracket_id), notice: "Set winner success END OF BRACKET"
      else
        next_winner_cell = Cell.find_by( bracket_id: current_cell.bracket_id, slot_id_cell_in_bracket: current_cell.cell_id_son )
        if next_winner_cell.nil?
          redirect_to request.headers["HTTP_REFERER"], alert: "Cell winner (next) #{current_cell.cell_id_son} doesn't exist"
        else
          current_cell.winner_participant_id = winner_participant.id
          current_cell.save
          next_winner_cell.participant_1_id = winner_participant.id if next_winner_cell.seed_id_parent_openent_1 == current_cell.slot_id_cell_in_bracket
          next_winner_cell.participant_2_id = winner_participant.id if next_winner_cell.seed_id_parent_openent_2 == current_cell.slot_id_cell_in_bracket
          next_winner_cell.save
          redirect_to  backoffice_bracket_show_path(next_winner_cell.bracket_id), notice: "Set winner success"
        end
      end
    end
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
      redirect_to backoffice_bracket_show_path(params[:bracket_id]), alert: "Bracket #{params[:bracket]} doesn't exist"
    else
      cells = Cell.where(bracket_id: bracket.id).all
      if cells.count != 0
        redirect_to backoffice_bracket_show_path(params[:bracket_id]), alert: "Cells already generated for bracket #{bracket.id}"
      else
        tournament = Tournament.find_by(id: bracket.tournament_id)
        if tournament.nil?
          redirect_to backoffice_bracket_show_path(params[:bracket_id]), alert: "Tournament #{bracket.tournament_id} doesn't exist on bracket #{bracket.id}"
        else
          event = Event.find_by(id: bracket.event_id)
          if cells.nil?
            redirect_to backoffice_bracket_show_path(params[:bracket_id]), alert: "Event #{bracket.event_id} doesn't exist on bracket #{bracket.id}"
          else
            i = 0
            bracket_size = bracketHelper_number_cell_with_number_participants(bracket.players)
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
            end
            @cells = Cell.where(bracket_id: params[:bracket_id]).all
            cellHelper_fill_parent_and_son_id(@cells.length + 1, @cells)
            bracket.cell_populated = true
            bracket.save
            redirect_to backoffice_bracket_show_path(params[:bracket_id]), notice: "Bracket #{bracket.id} populated and parents & sons assignated success"
          end
        end
      end
    end
  end

  def son_fillit
    @cells = Cell.where(bracket_id: params[:bracket_id]).all
    cellHelper_fill_parent_and_son_id(@cells.length + 1, @cells)
    redirect_to backoffice_bracket_show_path(params[:bracket_id]), notice: "Parent & Son assigned !"
  end

  def bracket_cells
    @cells = Cell.where(bracket_id: params[:bracket_id]).order(slot_id_cell_in_bracket: :asc).paginate(page: params[:page])
  end

private
  def cell_match_edit_params
    params.require(:cell).permit( :score_1, :score_2, :scheduled, :winner_participant_id, :info, :status_id )
  end
end
