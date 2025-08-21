class CreateIpVisitors < ActiveRecord::Migration[8.0]
  def change
    create_table :ip_visitors do |t|
      t.string :ip_address, null: false
      t.text :user_agent
      t.datetime :last_visit
      t.integer :visit_count, default: 0

      t.timestamps
    end
    
    add_index :ip_visitors, :ip_address, unique: true
    add_index :ip_visitors, :last_visit
    add_index :ip_visitors, :visit_count
  end
end
