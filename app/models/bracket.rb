class Bracket < ActiveRecord::Base

  def find_event_id_with_tournament_id
    result = Event.find_by(id: self.tournament_id)
    return nil if result.nil?

    result.id
  end

  def tournament_name
    result = Tournament.unscoped.find_by(id: self.created_by)
    return result.name if !result.nil?
    ""
  end

  def creator_user_name
    result = User.unscoped.find_by(id: self.created_by)
    return result.username if !result.nil?
    ""
  end
end
