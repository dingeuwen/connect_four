class AddUser2IdToGame < ActiveRecord::Migration
  def change
    add_column :games, :user2_id, :integer
  end
end
