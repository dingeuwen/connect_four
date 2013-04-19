class Gameplay < ActiveRecord::Base
  attr_accessible :game_id, :user1_id, :user2_id

  belongs_to :user
  belongs_to :game 

end
