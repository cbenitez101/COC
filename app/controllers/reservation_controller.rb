class ReservationController < ApplicationController
	def index
  	@restaurantsprov = Restaurant.all.group('provincia')
  	@restaurantsloc = Restaurant.all.group('localidad')
  	@restaurantsname = Restaurant.all.group('name')
  end


  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if current_user
      @user = User.find(current_user.id)
      @users = User.all
      @profiles = User.find(current_user.id).profile
      @data_history = User.find(current_user.id).history
      @orders = User.find(current_user.id).history.order
      @reservations = User.find(current_user.id).history.reservation

    end
  end

  # GET /profiles/new
  def new
    @reservation = Reservation.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @reservation = Reservation.new(profile_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Tu perfil se ha actualizado con exito' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @reservation.update(profile_params)
        format.html { redirect_to @preservation, notice: 'Tu perfil se ha actualizado con exito' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Tu perfil se ha destruido con exito' }
      format.json { head :no_content }
    end
  end

  def require_permission
    if current_user != Profile.find(params[:id]).user
      flash[:notice] = "No tienes permisos para entrar en esta pagina!"
      redirect_to root_path
      #Or do something else here
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:reservation).permit(:diners, :restaurant_id, :time)
    end
end
