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
  # POST /users
  # POST /users.json
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Сказать UserMailer отослать приветственное письмо после сохранения
        UserMailer.welcome_email(@user).deliver

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
