class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string 'name', null: false
      t.string 'description', default: ""
      t.string 'body', default: ""
      t.boolean 'visible', default: false
      t.string 'banner', default: ""

      t.timestamps null: false
    end
  end
end
