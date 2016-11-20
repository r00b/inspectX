class InspectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]
  before_action :set_mechanic, only: [:new, :create]

  # GET /inspections
  # GET /inspections.json
  def index
    @inspections = Inspection.where(user_id: current_user.andand.id)
  end

  # GET /inspections/1
  # GET /inspections/1.json
  def show
    @inspections = Inspection.find(params[:id])
  end

  # GET /inspections/new
  def new
    @inspection = Inspection.new
  end

  # GET /inspections/1/edit
  def edit
  end

  # POST /inspections
  # POST /inspections.json
  def create
    @inspection = current_user.inspections.new(inspection_params)
    @inspection.time = @inspection.corrected_time
    @inspection.mechanic = @mechanic

    respond_to do |format|
      if @inspection.valid?
        @inspection.save
        format.html { redirect_to @inspection, notice: 'Inspection was successfully scheduled.' }
        format.json { render :show, status: :created, location: @inspection }
        @inspection.braintree_id = 58
        # @btransaction = Braintree::Transaction.sale(amount: @inspection.mechanic.price,
        #                                             credit_card: { number: inspection_params[:card_number],
        #                                                            expiration_year: inspection_params[:card_year],
        #                                                            expiration_month: inspection_params[:card_month],
        #                                                            cvv: inspection_params[:cvv] },
        #                                             customer: { first_name: inspection_params[:your_name],
        #                                                         email: inspection_params[:your_email] },
        #                                             billing: { street_address: inspection_params[:your_address] },
        #                                             options: { submit_for_settlement: true })
        # if @btransaction.success?
        #     @inspection.braintree_id = @btransaction.transaction.id
        #     @inspection.save
        #     format.html { redirect_to @inspection, notice: 'Inspection was successfully scheduled.' }
        #     format.json { render :show, status: :created, location: @inspection }
        else
          @inspection.errors.add(:card_number, @btransaction.errors.map(&:message).join(".\n"))

          format.html { render :new }
          format.json { render json: @inspection.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspections/1
  # PATCH/PUT /inspections/1.json
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: 'Inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1
  # DELETE /inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: 'Inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mechanic
      @mechanic   = Mechanic.find_by_id(params[:mechanic_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params.require(:inspection).permit(:mechanic_id,
        :user_id, :location, :vehicle_year,
        :vehicle_make, :vehicle_model, :date, :time, :created_at, :updated_at,
        :your_name, :your_address, :your_phone, :your_email,
        :seller_name, :seller_address, :seller_phone, :seller_email, :mechanic_id, :user_id,
        :card_number, :card_year, :card_month, :card_cvv)
    end
end
