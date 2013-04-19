class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :game_status
      t.integer :whos_turn
      t.text :spaces

      t.timestamps
    end
  end
end
