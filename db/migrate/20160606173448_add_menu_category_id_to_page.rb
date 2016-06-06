class AddMenuCategoryIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :menu_category_id, :integer
  end
end
