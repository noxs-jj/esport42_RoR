class Event < ActiveRecord::Base
  def user_name
    result = User.unscoped.find(self.created_by).username
    return result if !result.blank?
    ""
  end
end
