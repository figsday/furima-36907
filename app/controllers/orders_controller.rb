class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def address_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :block_num, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end