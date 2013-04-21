class AddTotalLossToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_loss, :integer
  end
end
