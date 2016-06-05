class Post < ActiveRecord::Base
  def user_name
    result = User.unscoped.find_by(id: self.user_id)
    return result.username if !result.nil?

    ""
  end
end
