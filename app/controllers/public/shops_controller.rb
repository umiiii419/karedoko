class Public::ShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shops = Shop.page(params[:page]).reverse_order
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

  def search_result
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
