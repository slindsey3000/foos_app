class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.text :description
      t.string :uploaded_by, null: false
      t.string :file_url, null: false

      t.timestamps
    end
    
    add_index :documents, :title
    add_index :documents, :uploaded_by
  end
end
