class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_customer_path
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :residence, :phone_numbar)
  end
end
