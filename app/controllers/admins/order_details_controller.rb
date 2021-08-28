class Admins::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order_detail.item_status == "製作中"
			  @order.update(order_status: 2)
			elsif @order.order_details.count ==  @order.order_details.where(item_status: "製作完了").count
			  @order.update(order_status: 3)
			end
      redirect_to admins_order_path(@order_detail.order)
    else
      render "show"
    end
  end
  private

  def order_detail_params
    params.require(:order_detail).permit(:item_status)
  end
end