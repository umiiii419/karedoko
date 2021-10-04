class Public::ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def index
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
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
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to shop_review_path(@shop)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to shop_reviews_path
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
