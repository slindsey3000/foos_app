class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :director, :boolean, default: false
    add_column :users, :about, :text
    add_column :users, :image_url, :string
  end
end
