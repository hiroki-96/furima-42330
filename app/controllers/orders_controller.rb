class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller

  def new
    @item = Item.find(params[:item_id])
  end

  def create
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end

def redirect_if_seller
  return unless current_user.id == @item.user_id

  redirect_to root_path
end
