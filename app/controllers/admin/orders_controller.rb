class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  end
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:status] == "confirmation"
      @order.order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end
  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end

end
