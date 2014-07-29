class PointsController < InheritedResources::Base
  belongs_to :itinerary
   before_filter :authenticate_user!

end
