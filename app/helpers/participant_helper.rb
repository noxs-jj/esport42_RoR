module ParticipantHelper
  def participant_help_bracket_tournament_list(tournament_id)
    tournament = Tournament.find_by(id: tournament_id)
    result = Participant.where(id: tournament.participant_ids) if !tournament.nil?
    return result if !result.nil?

    []
  end

  def participant_help_collection_participant_name_id(arr_objects)
    result = arr_objects.map do |entry|
      [entry.user_name, entry.id]
    end
    result.insert(0, ["NOTHING", -1])

    result
  end

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
