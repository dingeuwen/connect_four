class Game < ActiveRecord::Base
  serialize :spaces

  attr_accessible :game_status, :spaces, :whos_turn, :id, :user1_id, :user2_id

  has_one :gameplay
  has_many :users, :through => :gameplays

  def user_a_turn(a_entry_column)
    token_position = self.spaces[a_entry_column].select{|x| x==0}.size
    self.spaces[a_entry_column][token_position - 1] = "X"
  end

  def user_b_turn(b_entry_column)
    token_position = self.spaces[b_entry_column].select{|x| x==0}.size
    self.spaces[b_entry_column][token_position - 1] = "*"
  end


    
  def check_for_win

    self.spaces.each_with_index do |x, xnum|
      x.each_with_index do |y, ynum|
        ["X", "*"].each do |symbol|

# i think theres a problem where i am reading the array from the back when i dont want it to. not sure though. 
        if (self.spaces[xnum][ynum] == symbol) && (self.spaces[xnum][ynum+1] == symbol) && (self.spaces[xnum][ynum+2] == symbol) && (self.spaces[xnum][ynum+3] == symbol)
          self.game_status = 2 
        elsif (self.spaces[xnum][ynum] == symbol) && (self.spaces[xnum+1][ynum] == symbol) && (self.spaces[xnum+2][ynum] == symbol) && (self.spaces[xnum+3][ynum] == symbol)
          self.game_status = 2 
        elsif (self.spaces[xnum][ynum] == symbol) && (self.spaces[xnum+1][ynum+1] == symbol) && (self.spaces[xnum+2][ynum+2] == symbol) && (self.spaces[xnum+3][ynum+3] == symbol)
          self.game_status = 2 
        elsif (self.spaces[xnum][ynum] == symbol) && (self.spaces[xnum+1][ynum-1] == symbol) && (self.spaces[xnum+2][ynum-2] == symbol) && (self.spaces[xnum+3][ynum-3] == symbol)
          self.game_status = 2 
        # elsif (self.spaces[xnum][ynum] == "*") && (self.spaces[xnum][ynum+1] == "*") && (self.spaces[xnum][ynum+2] == "*") && (self.spaces[xnum][ynum+3] == "*")
        #   self.game_status = 2 
        # elsif (self.spaces[xnum][ynum] == "*") && (self.spaces[xnum+1][ynum] == "*") && (self.spaces[xnum+2][ynum] == "*") && (self.spaces[xnum+3][ynum] == "*")
        #   self.game_status = 2 
        # elsif (self.spaces[xnum][ynum] == "*") && (self.spaces[xnum+1][ynum+1] == "*") && (self.spaces[xnum+2][ynum+2] == "*") && (self.spaces[xnum+3][ynum+3] == "*")
        #   self.game_status = 2 
        # elsif (self.spaces[xnum][ynum] == "*") && (self.spaces[xnum+1][ynum-1] == "*") && (self.spaces[xnum+2][ynum-2] == "*") && (self.spaces[xnum+3][ynum-3] == "*")
        #   self.game_status = 2 
          end
        end
      end
    end
  end


  # def end_game
    
  #   puts "STOP EVERYTHING, SOMEONE HAS WON!"

  #   # if @count_a > @count_b
  #   #   puts "Player A has won! Game over! Thanks for playing!"
  #   # elsif 
  #   #   puts "Player B has won! Game over! Thanks for playing!"
  #   # end

  #   # begin
  #   #   raise Win
  #   # rescue Win => ex
  #   #   puts ex.win_message
  #   # end
  # end


end
