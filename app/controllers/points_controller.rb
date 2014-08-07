class PointsController < InheritedResources::Base
  load_and_authorize_resource

  belongs_to :itinerary
  def create
    @itinerary= Itinerary.find(params[:itinerary_id])
    @point = @itinerary.points.new(params[:point])
    respond_to do |format|
    if @point.save
      format.js { }
    end
  end

  def destroy
    @point = Point.find(params[:id])
    if @point.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  end
end
