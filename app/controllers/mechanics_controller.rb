class MechanicsController < ApplicationController
  #devise authorization
  #before_action :authenticate_user!
  
  #cancan authorization
  #load_and_authorize_resource

  #before_action :set_mechanic, only: [:show, :edit, :update, :destroy, :approve]

  # GET /mechanics
  # GET /mechanics.json
  def index
    @mechanics1 = Mechanic.where(approved: true).order("created_at DESC")
    @mechanics2 = Mechanic.where(approved: nil).order("created_at DESC")
    @mechanics = @mechanics1 + @mechanics2
    if params[:search]
     @mechanics = Mechanic.search(params[:search])
    else
     @mechanics = @mechanics
    end
  end

  # GET /mechanics/1
  # GET /mechanics/1.json
  def show
    @mechanic = Mechanic.find(params[:id])
    #@inspections = @user.inspections
  end

  # GET /mechanics/new
  def new
    @mechanic = Mechanic.new
    @user = User.new
  end

  # GET /mechanics/1/edit
  def edit
  end

  # POST /mechanics
  # POST /mechanics.json
  def create
    @mechanic = Mechanic.new params.require(:mechanic).permit(:bio, :kind, :company, :address, :city, :state, :zip, :speciality, :price)
    @user = User.new params[:mechanic].require(:user).permit(:name, :email, :password, :password_confirmation)
    @user.role = :mechanic
    @mechanic.approved = nil

    respond_to do |format|
      if @user.save
        @mechanic.user_id = @user.id
        if @mechanic.save
          format.html { redirect_to @mechanic, notice: 'Mechanic was successfully created.' }
          format.json { render :show, status: :created, location: @mechanic }
        else
          format.html { render :new }
          format.json { render json: @mechanic.errors, status: :unprocessable_entity }
        end
      else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def search(mechanics)
    mechanics = mechanics.includes(:address, :mechanic_profile, :specialties).references(:specialties).where(addresses: {zip: params[:zip]})

    if mechanics.count > 20 && params[:make]
      mech = mechanics.where(specialties: {vehicle_make: params[:make].capitalize})
      if mech.count >= 5
        mechanics = mech
      end
    end
  end

  # PATCH/PUT /mechanics/1
  # PATCH/PUT /mechanics/1.json
  def update
    respond_to do |format|
      if @mechanic.update(mechanic_params)
        format.html { redirect_to @mechanic, notice: 'Mechanic was successfully updated.' }
        format.json { render :show, status: :ok, location: @mechanic }
      else
        format.html { render :edit }
        format.json { render json: @mechanic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanics/1
  # DELETE /mechanics/1.json
  def destroy
    @mechanic.destroy
    respond_to do |format|
      format.html { redirect_to mechanics_url, notice: 'Mechanic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /mechanics/1/approve
  def approve
    @mechanic = Mechanic.find(params[:id])

    authorize! :all, @mechanic
    @mechanic.update(approved: true)
    if @mechanic.save
      redirect_to action: :index # notice: 'Mechanic was successfully approved.'
    else
      redirect_to render :unapproved, error: @mechanic.errors
    end
  end

  def unapprove
    @mechanic = Mechanic.find(params[:id])

    authorize! :all, @mechanic
    @mechanic.update(approved: false)
    if @mechanic.save
      redirect_to action: :unapproved # notice: 'Mechanic was successfully approved.'
    else
      redirect_to render :unapproved, error: @mechanic.errors
    end
  end

  # GET /mechanics/unapproved
  def unapproved
    authorize! :all, @mechanics
    @mechanics = Mechanic.where approved: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_mechanic
      #@mechanic = Mechanic.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mechanic_params
      params.require(:mechanic).permit(:bio, :kind, :company, :address, :city, :state, :zip, :speciality, :price)
    end

    def user_params
      params.require(:mechanic).permit(user: [:name, :email, :password, :password_confirmation])
    end
end