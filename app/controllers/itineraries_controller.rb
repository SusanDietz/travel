class ItinerariesController < InheritedResources::Base
     before_filter :authenticate_user!
    def show
        @itinerary = Itinerary.find(params[:id])
        @points = @itinerary.points
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @itenerary }
        end
    end

     def create
       create! { itineraries_path }
      end
end
