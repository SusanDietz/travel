class PointsController < InheritedResources::Base
  belongs_to :itinerary
  def create
    @itinerary= Itinerary.find(params[:itinerary_id])
    respond_to do |format|
      format.json {
        @point = @itinerary.points.new(params[:point])
        if @point.save
            render :js => @point
        else
            render :json => :error
        end
        }
        format.js
    end
  end
end
