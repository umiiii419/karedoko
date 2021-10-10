class Public::HomesController < ApplicationController
  before_action :set_search

  def top
  end

  def set_search
    @q = Shop.ransack(params[:q])
    @results = @q.result
  end

end
