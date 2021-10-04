class Admins::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to admins_shop_path(@shop.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def shop_params
    params.require(:shop).permit(
      :genre_id,
      :name,
      :name_kana,
      :image,
      :address,
      :telephone_number,
      :opening_hours,
      :regular_holiday,
      :nearest_station,
      :is_deleted
    )
  end

end
