class Event < ActiveRecord::Base
  def user_name
    result = User.unscoped.find(self.created_by).username
    return result if !result.blank?
    ""
  end

  def status_name
    result = EventStatus.find_by(id: self.status_id)
    return result.name if !result.nil?
    "nil"
  end

end
