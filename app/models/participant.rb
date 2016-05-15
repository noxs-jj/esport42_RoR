class Participant < ActiveRecord::Base
  belongs_to :participant_types
  belongs_to :participant_statuses
  has_one :events
  has_one :users

  def user_name
    result = User.unscoped.find(self.user_id).username
    return result if !result.blank?
    ""
  end

  def user_email
    result = User.unscoped.find(self.user_id).email
    return result if !result.blank?
    ""
  end

  def type_name
    result = ParticipantType.unscoped.find(self.type_id).name
    return result if !result.blank?
    ""
  end

  def status_name
    result = ParticipantStatus.unscoped.find(self.status_id).name
    return result if !result.blank?
    ""
  end
end
