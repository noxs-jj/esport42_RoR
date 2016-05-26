class Cell < ActiveRecord::Base
  self.per_page = 16

  def tournament_name
    result = Tournament.find_by(id: self.tournament_id)
    return result.name if !result.nil?

    ""
  end

  def event_name
    result = Event.find_by(id: self.event_id)
    return result.name if !result.nil?

    ""
  end

  def bracket_name
    result = Bracket.find_by(id: self.event_id)
    return result.name if !result.nil?

    ""
  end

  def user_name
    result = User.find_by(id: self.event_id)
    return result.username if !result.nil?

    ""
  end

  def participant_1_name
    result = Participant.unscoped.find_by(id: self.participant_1_id)
    user = User.unscoped.find_by(id: result.user_id) if !result.nil?
    return user.username if !result.nil?

    ""
  end

  def participant_2_name
    result = Participant.unscoped.find_by(id: self.participant_2_id)
    user = User.unscoped.find_by(id: result.user_id) if !result.nil?
    return user.username if !result.nil?

    ""
  end

  def winner_name
    result = Participant.unscoped.find_by(id: self.winner_participant_id)
    user = User.unscoped.find_by(id: result.user_id) if !result.nil?
    return user.username if !result.nil?

    ""
  end
end
