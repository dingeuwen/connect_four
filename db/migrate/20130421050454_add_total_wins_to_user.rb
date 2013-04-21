class AddTotalWinsToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_wins, :integer
  end
end
