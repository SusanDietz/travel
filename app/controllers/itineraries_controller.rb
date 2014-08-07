class ItinerariesController < InheritedResources::Base
    load_and_authorize_resource
    has_scope :page, :default => 1

    def show
        @itinerary = Itinerary.find(params[:id])
        @points = @itinerary.points
        @hash = Gmaps4rails.build_markers(@points) do |point, marker|
          marker.lat point.latitude
          marker.lng point.longitude
          marker.infowindow point.description
        end
        @pf = Gmaps4rails.build_markers(@points.first) do |point, marker|
          marker.lat point.latitude
          marker.lng point.longitude
        end
        @pl = Gmaps4rails.build_markers(@points.last) do |point, marker|
          marker.lat point.latitude
          marker.lng point.longitude
          end
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @itenerary }
          format.json { render json: @hash }
          format.json { render json: @pf }
          format.json { render json: @pl }
        end
    end
  def index
    @itineraries = Itinerary.page(params[:page]).per(5)
    @hash = Gmaps4rails.build_markers(Itinerary.first.try(:points)) do |point, marker|
      marker.lat point.latitude
      marker.lng point.longitude
      marker.infowindow point.description
    end
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @hash }
        format.js
    end
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    @itinerary.owner_id = current_user.id
    respond_to do |format|
    if @itinerary.save
      UserItinerary.create(user_id: current_user.id, itinerary_id: @itinerary.id)
      format.html { redirect_to @itinerary, notice:'itinerary was successfully created.' }
      format.json { render json: @itinerary, status: :created, location: @itinerary }
    end
  end
  # create вызывается много раз, работает не правильно
  #   create! { itineraries_path }
  # # POST /users
  # # POST /users.json
  #   @user = User.new(params[:user])
  #   respond_to do |format|
  #     if @user.save
  #       # Сказать UserMailer отослать приветственное письмо после сохранения
  #       UserMailer.welcome_email(@user).deliver

  #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
  #       format.json { render json: @user, status: :created, location: @user }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #       avatar
  #     end
  #   end
  end
end
