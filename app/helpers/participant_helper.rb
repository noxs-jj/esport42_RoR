module ParticipantHelper
  def participant_help_is_event_registration_opend?(event_id)
    event = Event.unscoped.find_by(id: event_id)
    return true if !event.nil? && event.status_id == EventStatus::REGISTRATION_OPENS

    false
  end

  def participant_help_is_user_register_to_event?(user_id, event_id)
    event = Participant.unscoped.find_by(event_id: event_id, user_id: user_id)
    return true if !event.nil?

    false
  end
end
