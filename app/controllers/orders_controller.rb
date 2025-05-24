class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order_address).permit(
    :postal_code,
    :prefecture_id,
    :city,
    :block,
    :building,
    :phone_number,
    :token
  ).merge(
    user_id: current_user.id,
    item_id: params[:item_id]
  )
end

def redirect_if_seller
  return unless current_user.id == @item.user_id

  redirect_to root_path
end
