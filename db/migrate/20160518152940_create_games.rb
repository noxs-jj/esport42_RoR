class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string 'name', null:false, default: ""
      t.string 'icon', default: ""
      t.string 'url', default: ""
      t.string 'editor', default: ""
      t.text 'info', default: ""

      t.timestamps null: false
    end
  end
end
