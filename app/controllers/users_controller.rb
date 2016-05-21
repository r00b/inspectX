class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :admin_only, except: [:show, :set_admin]
  before_action :set_user, only: [:set_admin]

  def index
    redirect_to :root
   # @user = User.find(params[:id])
   # @inspection = Inspection.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    # unless current_user.admin?
    #   unless @user == current_user
    #     redirect_to :root, :alert => "Access denied."
    #   end
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def set_admin
    @user.role = User.roles[:admin]
    if @user.save
      redirect_to @user, :notice => "User updated."
    end
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :root, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
