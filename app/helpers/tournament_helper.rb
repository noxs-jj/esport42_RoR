module TournamentHelper
  def tournamentHelper_get_participant_from_user_event_tournament(user_id, event_id, tournament_id)
    participant_event = Participant.find_by(event_id: event_id, user_id: user_id)
    tournament = Tournament.find_by(id: tournament_id)
    return participant_event if !tournament.nil? && !participant_event.nil? && tournament.participant_ids.include?(participant_event.id)

    nil
  end

  def tournamentHelper_list_tournaments_from_event_id(event_id)
    Tournament.where(event_id: event_id)
  end

  def tournamentHelper_is_event_can_create_tournament?(event_id)
    event = Event.find_by(id: event_id)
    return false if event.nil?
    return true if event.status_id == EventStatus::REGISTRATION_OPENS || event.status_id == EventStatus::PENDING || event.status_id == EventStatus::ANNOUNCED

    false
  end
end
