class AddUser1IdToGame < ActiveRecord::Migration
  def change
    add_column :games, :user1_id, :integer
  end
end
