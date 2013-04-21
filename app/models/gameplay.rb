class Gameplay < ActiveRecord::Base
  attr_accessible :game_id, :user1_id, :user2_id

  belongs_to :user, :foreign_key => :user1_id
  belongs_to :game, :foreign_key => :game_id

end
