class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :author, null: false
      t.datetime :published_at
      t.boolean :featured, default: false
      t.string :image_url
      t.string :slug, null: false

      t.timestamps
    end
    
    add_index :articles, :slug, unique: true
    add_index :articles, :published_at
    add_index :articles, :featured
  end
end
