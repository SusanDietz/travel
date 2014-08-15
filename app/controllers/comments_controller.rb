class CommentsController < InheritedResources::Base
  load_and_authorize_resource
  
  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @comment = @itinerary.comments.create(params[:comment].merge(user_id: current_user.id))
    redirect_to @itinerary
  end
end