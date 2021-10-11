class AddressesController < ApplicationController
  def create
    Address.create(address_params)
  end

  private
  def address_params
    params.require(:address).permit(:text).merge(user_id: current_user.id, order_id: params[:order_id])
  end
end
