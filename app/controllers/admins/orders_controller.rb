class Admins::OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def update
		@order = Order.find(params[:id])
    if @order.update(order_params)
    	if params[:order][:order_status] == "入金確認"
    		@order.order_details.each do |order_detail|
    			order_detail.update(item_status: 1)
    		end
    	end
      redirect_to admins_order_path(@order)
    else
      render :show
    end
	end

	private

	def order_params
		params.require(:order).permit(:order_status)
	end
end
