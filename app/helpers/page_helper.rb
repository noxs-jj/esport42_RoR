module PageHelper
  def get_page_from_menu_category_id(menu_id)
    Page.where(menu_category_id: menu_id, visible: true)
  end
end
