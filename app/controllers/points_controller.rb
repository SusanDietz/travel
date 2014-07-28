class PointsController < ApplicationController

   before_filter :authenticate_user!

  # GET /points
  # GET /points.json
  def index
   
    @points = Point.where(user_id: current_user.id)
    @hash = Gmaps4rails.build_markers(@points) do |point, marker|
        marker.lat point.latitude.to_f
        marker.lng point.longitude.to_f
        marker.infowindow point.description
    end
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @points }
        format.json { render json: @hash }
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
        @point = Point.new (params[:point])
        @point.user_id = current_user.id
      if @point.save
        redirect_to @point, notice: 'Point was successfully created.'
      else
        render action: "new"
      end
}
format.json {
      @ajaxpoint = Point.new(params[:newPoint])
      @ajaxpoint.user_id = current_user.id
      if @ajaxpoint.save
         render json: @ajaxpoint, status: :created, location: @ajaxpoint
      else
         render json: @ajaxpoint, status: :error, location: @ajaxpoint
      end
    }
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