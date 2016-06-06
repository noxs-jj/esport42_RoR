class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string 'name', null: false
      t.string 'color', default: ""
      t.boolean 'visible', default: false

      t.timestamps null: false
    end
  end
end
