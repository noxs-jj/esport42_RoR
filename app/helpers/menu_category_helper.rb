module MenuCategoryHelper
  def get_menu_category_visible
    MenuCategory.where(visible: true)
  end

  def collection_menu_category
    MenuCategory.all.map { |t|
      ["#{t.name} [#{t.visible}]visible", t.id]
    }
  end
end
