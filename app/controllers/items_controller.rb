class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :region_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end
end