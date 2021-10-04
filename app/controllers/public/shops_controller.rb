class Public::ShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  #seach

end
