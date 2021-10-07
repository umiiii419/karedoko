class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_users_path
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :nickname, :email, :introduction, :is_deleted)
  end

end
