class Tournament < ActiveRecord::Base
  def self.tournament_list
    Tournament.where( "tournament_status = ? OR tournament_status = ?",
        TournamentStatus::REGISTRATION_OPENS,
        TournamentStatus::IN_PROGRESS
      ).map do |t|
        [t.name, t.id]
    end
  end

  def creator_user_name
    result = User.unscoped.find_by(id: self.created_by)
    return result.username if !result.nil?

    ""
  end

  def game_name
    result = Game.unscoped.find_by(id: self.game_id)
    return result.name if !result.nil?

    ""
  end

  def event_name
    result = Event.unscoped.find_by(id: self.event_id)
    return result.name if !result.nil?

    ""
  end

  def status_name
    result = TournamentStatus.unscoped.find_by(id: self.tournament_status)
    return result.name if !result.nil?

    ""
  end
end
