class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @q = Shop.ransack(params[:q])
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def search
    @q = Shop.ransack(params[:q])
    @results = @q.result
  end

end
