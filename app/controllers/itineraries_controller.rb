class ItinerariesController < InheritedResources::Base
  load_and_authorize_resource
  has_scope :page, :default => 1

  def participate
    @participant = @itinerary.user_itineraries.new(user_id: current_user.id)
    if @participant.save
      flash[:success] = 'Success'
    else
      flash[:alert] = 'Error'
    end
    redirect_to itinerary_path(@itinerary)
  end

  def show
    @points = @itinerary.points
    @comment = Comment.new
    @hash = Gmaps4rails.build_markers(@points) do |point, marker|
      marker.lat point.latitude
      marker.lng point.longitude
      marker.infowindow point.description
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itenerary }
      format.json { render json: @hash }
    end
  end

  def index
    if params[:owned] && current_user.present?
      scope = current_user.itineraries
    else
      scope = Itinerary
    end
    @itineraries = scope.order('created_at desc').page(params[:page]).per(5)
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
      @itinerary.user_itineraries.create(user_id: current_user.id)
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
