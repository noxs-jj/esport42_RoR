class Event < ActiveRecord::Base
  def tournament_list
  end

  def self.list_event_registrable
    Event.where(
      "status_id = ? OR status_id = ? OR status_id = ?",
      EventStatus::REGISTRATION_OPENS,
      EventStatus::PENDING,
      EventStatus::ANNOUNCED,
    ).map do |t|
      ["#{t.id} - #{t.name}", t.id]
    end
  end

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
