class Public::ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to review_path
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(
      :user_id,
      :shop_id,
      :title,
      :body,
      :image,
      :rate
    )
  end

end
