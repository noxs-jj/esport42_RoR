class Cell < ActiveRecord::Base
  def participant_1_name
    result = Participant.unscoped.find_by(id: self.participant_1_id)
    user = User.unscoped.find_by(id: result.user_id) if !result.nil?
    return user.name if !result.nil?

    ""
  end

  def participant_2_name
    result = Participant.unscoped.find_by(id: self.participant_2_id)
    user = User.unscoped.find_by(id: result.user_id) if !result.nil?
    return user.name if !result.nil?

    ""
  end
end
