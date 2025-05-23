class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
  end
end
