class Backoffice::ParticipantController < Backoffice::ApplicationController
  load_and_authorize_resource

  def event_tournament_participants
    @participants_tounament = Tournament.find_by(id: params[:tournament_id]).participant_ids
    @participants_event = Participant.where(event_id: params[:event_id] ).order(created_at: :desc)
  end

#http://stackoverflow.com/questions/17447555/adding-to-database-without-refreshing-the-page
  def tournament_participants_add
    @tournament = Tournament.find_by(id: params[:id])
    entry = params[:entry]
    if @tournament.participant_ids.include?(entry[:participant_id].to_i) == false
      @tournament.participant_ids.push(entry[:participant_id].to_i)
      @tournament.save
      @participants_tounament = Participant.where( "#{params[:tournament_id]} = ANY (tournament_ids)" ).order(created_at: :desc)
      @participants_event = Participant.where(event_id: params[:event_id] ).order(created_at: :desc)

      respond_to do |format|
        format.js
      end
    end
    # render :event_tournament_participants, change: [:participant_tournament_list]

  end

  def tournament_participants_remove
    @tournament = Tournament.find_by(id: params[:id])
    entry = params[:entry]
    @tournament.participant_ids.delete(entry[:participant_id].to_i)
    @tournament.save
    @participants_tounament = Participant.where( "#{params[:tournament_id]} = ANY (tournament_ids)" ).order(created_at: :desc)
    @participants_event = Participant.where(event_id: params[:event_id] ).order(created_at: :desc)

    respond_to do |format|
      format.js
    end
  end

  def index
    @participants = Participant.where(event_id: params[:event_id]).order(created_at: :desc)
  end

  def update
    participant = Participant.find_by(id: params[:id])
    if participant
      if participant.update(participant_param)
        redirect_to backoffice_event_participant_index_path(params[:event_id]), notice: "Update success"
      else
        redirect_to backoffice_event_participant_index_path(params[:event_id]), alert: "Update failed, plz contact admin"
      end
    else
      redirect_to backoffice_event_participant_index_path(params[:event_id]), alert: "Participant #{params[:id]} on event #{params[:event_id]} doesn't exist"
    end
  end

  def delete
  end

private
  def participant_param
    params.require(:participant).permit( :type_id, :status_id, :tournament_ids )
  end
end
