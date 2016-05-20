class Tournament < ActiveRecord::Base
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
end
