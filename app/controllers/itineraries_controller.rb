class ItinerariesController < InheritedResources::Base
     before_filter :authenticate_user!
    def show
        @itinerary = Itinerary.find(params[:id])
        @points = @itinerary.points
        
        @hash = Gmaps4rails.build_markers(@points) do |point, marker|
          marker.lat point.latitude
          marker.lng point.longitude
          marker.infowindow point.description
        end
        @pf = Point.first
        @pl = Point.last
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @itenerary }
          format.json { render json: @hash }
          format.json { render json: @pf }
          format.json { render json: @pl }
        end
    end

     def create
       create! { itineraries_path }
      end
end
