class MechanicSearchesController < ApplicationController
  before_action :set_mechanic_search, only: [:show, :edit, :update, :destroy]

  # GET /mechanic_searches
  # GET /mechanic_searches.json
  def index
    @mechanic_searches = MechanicSearch.all
  end

  # GET /mechanic_searches/1
  # GET /mechanic_searches/1.json
  def show
  end

  # GET /mechanic_searches/new
  def new
    @mechanic_search = MechanicSearch.new
  end

  # GET /mechanic_searches/1/edit
  def edit
  end

  # POST /mechanic_searches
  # POST /mechanic_searches.json
  def create
    @mechanic_search = MechanicSearch.new(mechanic_search_params)

    respond_to do |format|
      if @mechanic_search.save
        format.html { redirect_to @mechanic_search, notice: 'Mechanic search was successfully created.' }
        format.json { render :show, status: :created, location: @mechanic_search }
      else
        format.html { render :new }
        format.json { render json: @mechanic_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mechanic_searches/1
  # PATCH/PUT /mechanic_searches/1.json
  def update
    respond_to do |format|
      if @mechanic_search.update(mechanic_search_params)
        format.html { redirect_to @mechanic_search, notice: 'Mechanic search was successfully updated.' }
        format.json { render :show, status: :ok, location: @mechanic_search }
      else
        format.html { render :edit }
        format.json { render json: @mechanic_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanic_searches/1
  # DELETE /mechanic_searches/1.json
  def destroy
    @mechanic_search.destroy
    respond_to do |format|
      format.html { redirect_to mechanic_searches_url, notice: 'Mechanic search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanic_search
      @mechanic_search = MechanicSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mechanic_search_params
      params.require(:mechanic_search).permit(:user_id, :zip, :vehicle_make)
    end
end
