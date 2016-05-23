class Backoffice::CellController < Backoffice::ApplicationController
  include BracketHelper
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
  end

  def populate_bracket
    bracket = Bracket.find_by(id: params[:bracket])
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
                seed_id_parent_openent_1: 0,
                participant_1_id: 0,
                score_1: 0,
                seed_id_parent_openent_2: 0,
                participant_2_id: 0,
                score_2: 0,
                scheduled: Time.now,
                winner_participant_id: 0,
                cell_id_son: 0,
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

  def bracket_cells
    @cells = Cell.where(bracket_id: params[:bracket_id])
  end

end
