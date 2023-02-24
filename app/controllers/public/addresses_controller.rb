class Public::AddressesController < ApplicationController
    before_action :authenticate_customer!
  def index
    if customer_signed_in?
    @addresses = Address.where(customer_id: current_customer.id)
    end
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(addresses_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.update(addresses_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  private
  def addresses_params
    params.require(:address).permit(:customer_id,:name,:postal_code,:address)
  end
end
