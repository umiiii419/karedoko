class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @q = Shop.ransack(params[:q])
    if @shop.review.blank?
      @average_review = 0
    else
      @average_rate = @shop.reviews.average(:rate).round(2)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    if @shop.reviews.blank?
      @average_review = 0
    else
      @average_review = @shop.reviews.average(:rate).round(2)
    end
  end

  def search
    @q = Shop.ransack(params[:q])
    @results = @q.result
  end

  def rank
  end

end
