class Participant < ActiveRecord::Base
  def user_name
    result = User.unscoped.find_by(id: self.user_id)
    return result.username if !result.nil?

    ""
  end

  def user_email
    result = User.unscoped.find_by(id: self.user_id)
    return result.email if !result.nil?

    ""
  end

  def type_name
    result = ParticipantType.unscoped.find_by(id: self.type_id)
    return result.name if !result.nil?

    ""
  end

  def status_name
    result = ParticipantStatus.unscoped.find_by(id: self.status_id)
    return result.name if !result.nil?

    ""
  end
end
