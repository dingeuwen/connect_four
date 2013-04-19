class CreateGameplays < ActiveRecord::Migration
  def change
    create_table :gameplays do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :game_id

      t.timestamps
    end
  end
end
