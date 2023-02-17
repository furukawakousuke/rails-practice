class Admin::OrderDetailsController < ApplicationController

  def update
   @order_detail = OrderDetail.find(params[:id])
   @order_detail.update(order_detail_params)
   if params[:order_detail][:making_status] == "production"
     @order = @order_detail.order
     @order.update(status: 2)
   elsif params[:order_detail][:making_status] == "finish"
     @order_detail.order.update(status: 3)
    end
   redirect_to admin_order_path(@order_detail.order)
  end

 private
 def order_detail_params
   params.require(:order_detail).permit(:order_id,:item_id,:price,:amount,:making_status)
 end
end