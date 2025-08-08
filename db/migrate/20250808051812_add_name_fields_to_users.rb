class AddNameFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :fullname, :string
  end
end
