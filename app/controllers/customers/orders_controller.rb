class Customers::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = Address.where(customer: current_customer)
  end

  def index
     @orders = current_customer.orders
  end

  def create

   # (商品の金額 * 数量) * 税率 + 送料
   cart_items = current_customer.cart_items
     total_price = 0
		 cart_items.each do |cart_item|
		 total_price += (cart_item.item.price* 1.1).round*(cart_item.amount)
    end

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_price = total_price
    @order.save

    # order_detail をつくる
    current_customer.cart_items.each do |ci|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = ci.item.id
      order_detail.item_price = ci.item.price * 1.1
      order_detail.amount = ci.amount
      order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to thanks_customers_orders_path
  end

  def thanks
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:delivery_address_option]=="0"
      @order.delivery_address = current_customer.address
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address_option]=="1"
      @address = Address.find(params[:order][:address])
      @order.delivery_address = @address.address
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_name = @address.name
    elsif params[:order][:delivery_address_option]=="2"
      @address = Address.new()
      @address.address = params[:order][:delivery_address]
      @address.postal_code = params[:order][:delivery_postal_code]
      @address.name = params[:order][:delivery_name]
      @address.customer_id = current_customer.id
    if @address.save
      @order.delivery_address = @address.address
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_name = @address.name
    else
       render 'new'
       end
    end
  end

private
  def order_params
    params.require(:order).permit(:payment_method, :delivery_address, :delivery_name, :delivery_postal_code, :delivery_fee, :total_price, :order_status)
  end

  def address_params
    params.permit(:address, :name, :postal_code, :customer_id)
  end

end
