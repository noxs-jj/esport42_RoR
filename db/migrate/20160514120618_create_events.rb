class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string 'name', null: false
      t.integer 'created_by', null: false
      t.integer 'games_ids', array: true, default: []
      t.integer 'tournament_ids', array: true, default: []
      t.integer 'participant_ids', array: true, default: []
      t.datetime 'date'
      t.string 'adress_line1', null: true, default: ""
      t.string 'adress_line2', null: true, default: ""
      t.string 'adress_line3', null: true, default: ""
      t.string 'adress_city', null: true, default: ""
      t.string 'adress_province', null: true, default: ""
      t.string 'adress_postalcode', null: true, default: ""
      t.string 'adress_country', null: true, default: ""
      t.string 'adress_otherDetails', null: true, default: ""

      t.timestamps null: false
    end
  end
end
