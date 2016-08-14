class ApproveMechanicsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  before_action :set_mechanic, except: :index

  def index
    @approved_mechanics = Mechanic.approved
    @unapproved_mechanics = Mechanic.unapproved
  end

  def update
    @mechanic.update(approved: true)
    if @mechanic.save
      redirect_to action: :index
    else
      render :index, error: @mechanic.errors
    end
  end

  def destroy
    @mechanic.update(approved: false)
    if @mechanic.save
      redirect_to action: :index
    else
      render :index, error: @mechanic.errors
    end
  end

  private

  def set_mechanic
    @mechanic = Mechanic.find(params[:id])
  end
end
