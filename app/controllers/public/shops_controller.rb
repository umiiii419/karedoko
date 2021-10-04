class Public::ShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def show
  end

  #seach

end
