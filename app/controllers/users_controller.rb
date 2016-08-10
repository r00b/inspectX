class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :index

  before_action :set_user, only: [:show, :update]

  def index
    @users = User.all
  end

  def show
  end

  def update
    if @user.update_attributes(secure_params)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  private

  def secure_params
    new_role = params.require(:user).permit(:role)
    { role: User.roles[new_role['role']] }
  end

  def set_user
    @user = User.find(params[:id])
  end

end