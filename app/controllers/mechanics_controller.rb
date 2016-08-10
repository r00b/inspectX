 class MechanicsController < ApplicationController
  #devise authorization
  # before_action :authenticate_user!

  before_action :set_mechanic, only: [:show, :edit, :update, :destroy]

  # GET /mechanics
  # GET /mechanics.json
  def index
    @approved_mechanics = Mechanic.approved
    @unapproved_mechanics = Mechanic.unapproved
    @mechanics = @approved_mechanics + @unapproved_mechanics

    if params[:search]
     @mechanics = Mechanic.search(params[:search])
    else
     @mechanics = @mechanics
    end
  end

  # GET /mechanics/1
  # GET /mechanics/1.json
  def show
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
    # binding.pry
    @mechanic = Mechanic.new params.require(:mechanic).permit(:bio, :kind, :company, :address, :city, :state, :zip, :speciality, :price, :picture)
    @user = User.new params[:mechanic].require(:user_attributes).permit(:name, :email, :password, :password_confirmation)
    @user.role = 1
    @mechanic.approved = false

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanic
      @mechanic = Mechanic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mechanic_params
      params.require(:mechanic).permit(:bio, :kind, :company, :address, :city, :state, :zip, :speciality, :price, :picture)
    end

    def user_params
      params.require(:mechanic).permit(user: [:name, :email, :password, :password_confirmation])
    end
end