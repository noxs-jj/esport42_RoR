class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
			t.integer 'user_id', null: true
			t.string 'nickname', null: true, default: ""
			t.string 'first_name', null: true, default: ""
			t.string 'last_name', null: true, default: ""
			t.string 'email', null: false
			t.string 'phone', null: true, default: ""
			t.string 'entity', null: true, default: ""
			t.string 'object', null: true, default: ""
			t.string 'message', null: false
			t.string 'other', null: true, default: ""
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
