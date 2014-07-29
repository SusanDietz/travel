class PointsController < InheritedResources::Base
  belongs_to :itinerary
  def create
  @so = 'Niec'
   respond_to do |format|
      format.json { render :json => @so }
    end
  end
end
