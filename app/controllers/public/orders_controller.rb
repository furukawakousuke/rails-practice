class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
      @order = Order.new(order_params)
    if params[:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      @order.save
    elsif params[:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      @order.save
    elsif params[:select_address] == "2"
      @order.save
    else
      render new
    end
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end
end
