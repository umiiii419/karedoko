class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path(current_user)
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def reviews
    @user = User.find(params[:id])
    @my_reviews = @user.reviews.all
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction, :email)
  end

end
