class ItinerariesController < InheritedResources::Base
     before_filter :authenticate_user!
     def create
       create! { itineraries_path }
      end
end
