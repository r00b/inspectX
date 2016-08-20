class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :index

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params_with_role)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  def destroy
    @user.destroy

    redirect_to :back
  end

  private

  def user_params_with_role
    new_role = user_params[:role]
    Mechanic.where(user_id: params[:id]).first_or_create if new_role == "mechanic"

    user_params.update(role: User.roles[new_role])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
