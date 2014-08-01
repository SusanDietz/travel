class PointsController < InheritedResources::Base
  belongs_to :itinerary
  def create
    @itinerary= Itinerary.find(params[:itinerary_id])
    @point = @itinerary.points.create(params[:point])
    respond_to do |format|
      format.js { }
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
