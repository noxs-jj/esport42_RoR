module TournamentHelper
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
