class Post < ActiveRecord::Base
  mount_uploader :banner, PostBannerUploader

  def user_name
    result = User.unscoped.find_by(id: self.user_id)
    return result.username if !result.nil?

    ""
  end
end
