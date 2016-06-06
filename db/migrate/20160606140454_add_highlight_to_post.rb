class AddHighlightToPost < ActiveRecord::Migration
  def change
    add_column :posts, :highlight, :boolean, default: false
  end
end
