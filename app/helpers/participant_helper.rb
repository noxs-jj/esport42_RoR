module ParticipantHelper
  def participantHelper_delete_participant_from_tournaments_and_events(participant_id)
    tournaments = Tournament.where("'#{participant_id}' = ANY (participant_ids)")
    events = Event.where("'#{participant_id}' = ANY (participant_ids)")
    if !tournaments.nil?
      tournaments.each do |tournament|
        tournament.participant_ids.delete(participant_id)
      end
    end
    if !events.nil?
      events.each do |event|
        event.participant_ids.delete(participant_id)
      end
    end
  end

  def participantHelper_list_participants_where_user_is_registered(user_id)
    Participant.where(user_id: user_id).order(created_at: :desc).first(10)
  end

  def participantHelper_list_event_from_participants_array(array_participants)
    result = []
    array_participants.each do |participant|
      event = Event.find_by(id: participant.event_id)
      result << event if !event.nil?
    end
    return result
  end

  def participantHelper_list_tournament_from_participants_array(array_participants)
    result = []
    array_participants.each do |participant|
      tournament = Tournament.find_by(event_id: participant.event_id)
      result << tournament if !tournament.nil?
    end
    return result
  end

  def participantHelper_list_participants_from_event_id(event_id)
    Participant.where(event_id: event_id)
  end

  def participant_help_how_many_participant_id_is_assigned_get_color(id_to_check, cells_array)
    result = 0
    - to_spawn = (@cells.length + 1) / 2
    - i = 0

    cells_array.each do |cell|
      result += 1 if cell.participant_1_id == id_to_check
      result += 1 if cell.participant_2_id == id_to_check
      i += 1
      break if i >= to_spawn
    end

    return "black" if result == 0
    return "green" if result == 1
    return "red" if result > 1
  end


  def participant_help_bracket_tournament_list(tournament_id)
    tournament = Tournament.find_by(id: tournament_id)
    result = Participant.where(id: tournament.participant_ids) if !tournament.nil?
    return result if !result.nil?

    []
  end

  def participant_help_collection_participant_name_id(arr_objects)
    result = []
    result = arr_objects.map do |entry|
      ["#{entry.id} #{entry.user_name}", entry.id]
    end
    result.insert(0, ["NOTHING", -1])

    result
  end

  def participantHelper_is_event_registration_opend?(event_id)
    event = Event.unscoped.find_by(id: event_id)
    return true if !event.nil? && event.status_id == EventStatus::REGISTRATION_OPENS

    false
  end

  def participantHelper_participant_user_and_event(user_id, event_id)
    event = Participant.unscoped.find_by(event_id: event_id, user_id: user_id)
    return event if !event.nil?

    nil
  end
end
