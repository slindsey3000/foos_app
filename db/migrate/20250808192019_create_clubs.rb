class CreateClubs < ActiveRecord::Migration[8.0]
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :phone
      t.string :email
      t.string :website
      t.string :coordinates
      t.text :day_and_time_info
      t.text :description
      t.string :image_url
      t.string :contact_person
      t.date :established_date

      t.timestamps
    end
    
    add_index :clubs, :name
    add_index :clubs, :city
    add_index :clubs, :state
    add_index :clubs, :zip_code
    add_index :clubs, :email
  end
end
