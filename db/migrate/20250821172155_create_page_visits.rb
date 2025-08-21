class CreatePageVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :page_visits do |t|
      t.references :ip_visitor, null: false, foreign_key: true
      t.string :page_path, null: false
      t.datetime :visited_at

      t.timestamps
    end
    
    add_index :page_visits, :page_path
    add_index :page_visits, :visited_at
  end
end
