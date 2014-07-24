class PointsController < ApplicationController
  before_filter :authenticate_user!
  # GET /points
  # GET /points.json
  def index
    @points = Point.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    @point = Point.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new
    @point = Point.new
    @point.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point}
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  # POST /points
  # POST /points.json
  def create
    respond_to do |format|
     format.html {
      @point = Point.new(params[:point])
      @point.user_id = current_user.id
      if @point.save
        redirect_to @point, notice: 'Point was successfully created.'
      else
        render action: "new"
      end
      }
      format.json {
      @ajaxpoint = Point.create(params[:newPoint])
      render json: @ajaxpoint, status: :created, location: @ajaxpoint }
    end
  end


  # PUT /points/1
  # PUT /points/1.json
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end
end
