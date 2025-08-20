class AddDirectorAndCommitteeFields < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :director_title, :string
    add_column :users, :world_cup_selection_committee, :boolean, default: false
  end
end
