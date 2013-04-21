class GamesController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @user = User.all
    @user_without_current_user = User.find(:all, :conditions => ["id != ?", current_user.id])
    selected_games_a = Game.where(:user1_id => current_user.id)
    selected_games_b = Game.where(:user2_id => current_user.id)
    selected_games = selected_games_a << selected_games_b
    @selected_games = selected_games.flatten.select { |game| game.game_status == 1}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    @gameplay = @game.gameplay
    # @gameplay = Gameplay.find_by_game_id(@game.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game]) #DONT REALLY GET THIS? WHERE WAS GAME SAVED TO PARAMS? 
    # @game.id.inspect
    @game.game_status = 1
    @game.whos_turn = current_user.id
    @game.spaces = [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]

    @game.user1_id = current_user.id 
    @game.user2_id = params[:opponent]

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])
    selected_column = params[:column].to_i

    if @game.whos_turn == @game.user1_id
      # update board
      @game.user_a_turn(selected_column)
      
    elsif @game.whos_turn == @game.user2_id
      @game.user_b_turn(selected_column)
    end

    @game.check_for_win

    if @game.game_status == 2
       @game.update_attributes(params[:game])
       render :action => 'endgame' and return
    end
    
    # switch users
    if @game.whos_turn == @game.user1_id
      @game.whos_turn = @game.user2_id
    elsif @game.whos_turn == @game.user2_id
      @game.whos_turn = @game.user1_id
    end

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Move made' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
