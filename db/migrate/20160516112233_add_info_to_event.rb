class AddInfoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :info, :text, default: ""
  end
end
