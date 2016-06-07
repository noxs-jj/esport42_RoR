class ParticipantController < ApplicationController
  include ParticipantHelper

  def index
    @participants = Participant.where(event_id: params[:event_id])\
                    .order(created_at: :desc)
  end

  def create
    if user_signed_in?
      if participantHelper_is_event_registration_opend?(params[:event_id])\
          || current_user.admin?
        if Participant.find_by( user_id: current_user.id,
                                event_id: params[:event_id]).nil?
          participant = Participant.new(
            user_id: current_user.id,
            event_id: params[:event_id],
            type_id: ParticipantType::VISITOR,
            status_id: ParticipantStatus::PENDING
          )
          participant.save
          if participant
            redirect_to event_show_path(params[:event_id]),
                        notice: "Register success"
          else
            redirect_to request.headers["HTTP_REFERER"],
                        alert: "Register failed, plz contact admin"
          end
        else
          redirect_to request.headers["HTTP_REFERER"],
                      alert: "You're already registered to this event"
        end
      else
        redirect_to request.headers["HTTP_REFERER"],
                    alert: "you can register on this \
                           event only when they're opened"
      end
    else
      redirect_to request.headers["HTTP_REFERER"],
                  alert: "You must be login to register an event"
    end
  end

  def show
  end

  def unregister
    if true == participantHelper_is_event_registration_opend?(params[:event_id])
      participant = Participant.find_by(user_id: params[:user_id],
                                      event_id: params[:event_id])
      ap participant
      if participant.nil?
        redirect_to request.headers["HTTP_REFERER"],
                    alert: "Participant from User##{params[:user_id].to_s} \
                          on Event##{params[:event_id].to_s} doesn't exist"
      else
        participantHelper_delete_participant_from_tournaments_and_events(participant.id)
        participant.destroy
        redirect_to request.headers["HTTP_REFERER"],
                    notice: "Participant unregister success"
      end
    end
  end
end
