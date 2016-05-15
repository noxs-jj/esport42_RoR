class ParticipantController < ApplicationController
  def index
    @participants = Participant.where(event_id: params[:event_id])
  end

  def create
    if user_signed_in?
      if Participant.find_by(user_id: current_user.id, event_id: params[:event_id]).nil?
        participant = Participant.new(
          user_id: current_user.id,
          event_id: params[:event_id],
          type_id: ParticipantType::VISITOR,
          status_id: ParticipantStatus::PENDING
        )
        participant.save
        if participant
          redirect_to event_show_path(params[:event_id]), notice: "Register success"
        else
          redirect_to request.headers["HTTP_REFERER"], alert: "Register failed, plz contact admin"
        end
      else
        redirect_to request.headers["HTTP_REFERER"], alert: "You're already registered to this event"
      end
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "You must be login to register an event"
    end
  end

  def show
  end

  def delete
  end
end
