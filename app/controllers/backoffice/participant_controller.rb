class Backoffice::ParticipantController < Backoffice::ApplicationController
  load_and_authorize_resource
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
