class GameplaysController < ApplicationController
  # GET /gameplays
  # GET /gameplays.json
  def index
    @gameplays = Gameplay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gameplays }
    end
  end

  # GET /gameplays/1
  # GET /gameplays/1.json
  def show
    @gameplay = Gameplay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gameplay }
    end
  end

  # GET /gameplays/new
  # GET /gameplays/new.json
  def new
    @gameplay = Gameplay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gameplay }
    end
  end

  # GET /gameplays/1/edit
  def edit
    @gameplay = Gameplay.find(params[:id])
  end

  # POST /gameplays
  # POST /gameplays.json
  def create
    @gameplay = Gameplay.new(params[:gameplay])

    respond_to do |format|
      if @gameplay.save
        format.html { redirect_to @gameplay, notice: 'Gameplay was successfully created.' }
        format.json { render json: @gameplay, status: :created, location: @gameplay }
      else
        format.html { render action: "new" }
        format.json { render json: @gameplay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gameplays/1
  # PUT /gameplays/1.json
  def update
    @gameplay = Gameplay.find(params[:id])

    respond_to do |format|
      if @gameplay.update_attributes(params[:gameplay])
        format.html { redirect_to @gameplay, notice: 'Gameplay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gameplay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameplays/1
  # DELETE /gameplays/1.json
  def destroy
    @gameplay = Gameplay.find(params[:id])
    @gameplay.destroy

    respond_to do |format|
      format.html { redirect_to gameplays_url }
      format.json { head :no_content }
    end
  end
end
