class Backoffice::ParticipantController < Backoffice::ApplicationController
  load_and_authorize_resource

  def event_tournament_participants
    tournament = Tournament.find_by(id: params[:tournament_id])
    @participants_tounament = []
    @participants_event = []
    @participants_tounament = Participant.where(id: tournament.participant_ids) if !tournament.nil? && !tournament.participant_ids.nil?
    @participants_event = Participant.where(event_id: params[:event_id] ).order(created_at: :desc)
  end

  def tournament_participants_radio_add
    tournament = Tournament.find_by(id: params[:tournament_id])
    params[:radio_event_add].each do |id_participant|
      if id_participant[1] == "1"
        if tournament.participant_ids.include?(id_participant[0].to_i) == false
          tournament.participant_ids.push(id_participant[0].to_i)
        end
      end
    end
    tournament.save

    redirect_to  backoffice_event_tournament_participants_path(event_id: tournament.event_id, tournament_id: tournament.id)
  end

  def tournament_participants_radio_remove
    tournament = Tournament.find_by(id: params[:tournament_id])
    params[:radio_event_remove].each do |id_participant|
      if id_participant[1] == "1"
        tournament.participant_ids.delete(id_participant[0].to_i)
      end
    end
    tournament.save

    redirect_to  backoffice_event_tournament_participants_path(event_id: tournament.event_id, tournament_id: tournament.id)
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

private
  def participant_param
    params.require(:participant).permit( :type_id, :status_id, :tournament_ids )
  end
end
