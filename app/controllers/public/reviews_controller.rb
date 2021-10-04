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
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.new(review_params)
    @review.shop_id = @shop.id
    @review.save
    redirect_to shop_review_path(@shop, @review)
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
