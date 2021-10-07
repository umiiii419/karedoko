class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @q = Shop.ransack(params[:q])
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
    @shops = Shop.
              left_joins(:reviews).
              distinct.
              sort_by do |shop|
                hoges = shop.reviews
                if hoges.present?
                  hoges.map(&:rate).sum / hoges.size
                else
                  0
                end
              end.
              reverse
  end

end
