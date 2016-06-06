class Page < ActiveRecord::Base
  mount_uploader :banner, PageBannerUploader

  def menu_category_name
    result = MenuCategory.find_by(id: self.menu_category_id)
    return result.name if !result.nil?

    ""
  end
end
