class Admins::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:residence,:phone_number,:email,:is_valid)
  end
end
