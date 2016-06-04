class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer 'user_id', null: false
      t.boolean 'visible', default: false
      t.string 'banner', default: ""
      t.string 'title', null: false, default: ""
      t.string 'description', default: ""
      t.text 'body', default: ""
      t.string 'sources', array: true, default: []

      t.timestamps null: false
    end
  end
end
